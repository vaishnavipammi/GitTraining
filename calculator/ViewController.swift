//
//  ViewController.swift
//  calculator
//
//  Created by fordlabs on 29/10/18.
//  Copyright © 2018 fordlabs. All rights reserved.
//

import UIKit

enum modes {
case not_set
case addition
case subtraction
case multiplication

}

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var labelString:String = "0"
    var currentMode:modes = .not_set
    var savedNum:Int = 0
    var lastButtonWasMode:Bool = false
    var pressingAfterEqual = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    func changeModes(newMode:modes){
        if(savedNum == 0)
        {
            return
        }
        currentMode = newMode
        lastButtonWasMode = true
        
        
    }

    @IBAction func didPressPlus(_ sender: Any) {
        pressingAfterEqual = false
        changeModes(newMode: .addition)
    }
    
    @IBAction func didPressMinus(_ sender: Any) {
        pressingAfterEqual = false
        
        changeModes(newMode: .subtraction)
    }
    
    @IBAction func didPressMultiply(_ sender: Any) {
        pressingAfterEqual = false
        changeModes(newMode: .multiplication)
    }
    
    @IBAction func didPressEquals(_ sender: Any) {
        pressingAfterEqual = true
        guard let labelInt:Int = Int(labelString) else {
            return
        }
        
        if (currentMode == .not_set || lastButtonWasMode)
        {
            return
        }
        if (currentMode == .addition){
            savedNum += labelInt
        }
        else if (currentMode == .subtraction){
            savedNum -= labelInt
        }
        else if (currentMode == .multiplication ){
            savedNum *= labelInt
        }
        
        currentMode = .not_set
        labelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
        labelString = "0"
        currentMode = .not_set
        
        lastButtonWasMode = false
        
        
    }
    
    @IBAction func didPressClear(_ sender: Any) {
         pressingAfterEqual = false
         labelString = "0"
         currentMode = .not_set
         savedNum = 0
         lastButtonWasMode = false
         label.text = "0"
        
    }
    
    @IBAction func didPressNumber(_ sender: UIButton) {
        
        
        let stringValue:String? = sender.titleLabel?.text
        
        if(lastButtonWasMode){
            lastButtonWasMode = false
            labelString = "0"
        }
        if(pressingAfterEqual)
        {
            labelString = "0"
            pressingAfterEqual = false
        }
        
        labelString = labelString.appending(stringValue!)
       
        updateText()
        
        
        
        
    }
    
    func updateText(){
        guard let labelInt:Int = Int(labelString) else {
            return
        }
        
        if(currentMode == .not_set){
            savedNum = labelInt
            
        }
        print("hellooo")
        print(label.text!)

        label.text = "\(labelInt)"
        print(labelInt)
        print(label.text!)

        
    }
    
    
    
    
    
    
    
    
}

