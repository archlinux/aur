# Maintainer: GG weebcyberpunk@gmail.com
pkgname=todo-stupid-git
pkgver=1.0.3
pkgrel=1
pkgdesc="The stupid todo list"
arch=("x86_64")
url="https://www.github.com/weebcyberpunk/todo"
license=('MIT')
provides=(todo)
source=("git+$url")
md5sums=('SKIP')

build() {
    cd "todo"
    make
}

package() {
    cd "todo"
    install -Dm755 todo $pkgdir/usr/bin/todo
    install -Dm644 "help.txt" $pkgdir/usr/share/$pkgname/"help.txt"
    install -Dm644 todo.1 $pkgdir/usr/share/man/man1/todo.1
}
