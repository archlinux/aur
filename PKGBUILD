# Maintainer: ache <ache@ache.one>

pkgname=todo.c++
pkgver=20170921
pkgrel=1
pkgdesc="A lightweight, by directory, todo-list utility"
arch=("any")
url="http://git.ache.one/todo"
license=('GPL3')
makedepends=('git')
conflicts=('todo.c' 'todo' 'todo.c++')
source=("todo.c++::git+http://git.ache.one/todo")

md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "todo" "$pkgdir/usr/bin/todo"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/todo.cpp/LICENSE"
}
