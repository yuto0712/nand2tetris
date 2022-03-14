// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
    @8192
    D=A
    @SCREENSIZE
    M=D
    @R0
    M=0
(LOOP)
    @KBD
    D=M
    @Pushed
    D;JNE
    @Detouched
    D;JEQ
(Pushed)
    @i
    M=1
    @Fill_loop
    0;JMP
(Fill_loop)
    @i
    D=M
    @SCREENSIZE
    D=D-M
    @LOOP
    D;JGT
    @i
    D=M
    @SCREEN
    A=A+D
    M=1
    @i
    M=M+1
    @Fill_loop
    0;JMP
(Detouched)
    @i
    M=1
    @Brank_loop
    0;JMP
(Brank_loop)
    @i
    D=M
    @SCREENSIZE
    D=D-M
    @LOOP
    D;JGT
    @i
    D=M
    @SCREEN
    A=A+D
    M=0
    @i
    M=M+1
    @Brank_loop
    0;JMP

