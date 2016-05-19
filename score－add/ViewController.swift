//
//  ViewController.swift
//  score－add
//
//  Created by 5759 on 16/4/18.
//  Copyright © 2016年 20131105759. All rights reserved.
//

//http://www.hangge.com/blog/cache/detail_645.html


//http://www.runoob.com/sqlite/sqlite-tutorial.html

//http://www.w2bc.com/article/91624



import UIKit



class ViewController: UIViewController {
    
    var a = 0
    var b = 0
    
    @IBAction func button5(sender: UIButton) {
    }
    @IBAction func button4(sender: UIButton) {
        if(!label2.text!.isEmpty)
        {
            b = (label2.text!as NSString).integerValue
            b = b+1
            label2.text = ("\(b)")
        }
    }
    @IBAction func button3(sender: UIButton) {
        if(!label1.text!.isEmpty)
        {
            a = (label1.text!as NSString).integerValue
            a = a+1
            label1.text = ("\(a)")
        }
    }
    @IBAction func button2(sender: UIButton) {
        if(!label2.text!.isEmpty)
        {
            b = (label2.text!as NSString).integerValue
            b = 0
            label2.text = ("\(b)")
        }
    }
    @IBAction func button1(sender: UIButton) {
        if(!label1.text!.isEmpty)
        {
            a = (label1.text!as NSString).integerValue
            a = 0
            label1.text = ("\(a)")
        }
    }
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!

        
    
    
    
    
    
    
    
    
    var db:SQLiteDB!
    @IBOutlet var txtUname1:UITextField!
    @IBOutlet var txtUname2:UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        initUser()
    }
    
    //save
    @IBAction func saveClicked(sender: AnyObject)
    {
        saveUser()
    }
    
    //从SQLite加载数据
    func initUser()
    {
        let data = db.query("select * from t_user")
        if data.count > 0
        {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            txtUname1.text = user["uname1"] as? String
            txtUname2.text = user["uname2"] as? String
        }
    }
    
    //保存数据到SQLite
    func saveUser()
    {
        let uname1 = self.txtUname1.text!
        let uname2 = self.txtUname2.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_user(uname1,uname2) values('\(uname1)','\(uname2)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

}

