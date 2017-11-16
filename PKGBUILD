# Maintainer: ache <ache@ache.one>

pkgname=todo.cpp
pkgver=20171116
pkgrel=1
pkgdesc="Command line lightweight todo tool, written in C++"
arch=("any")
url="http://git.ache.one/todo"
license=('GPL3')
makedepends=('git')
provides=('todo.cpp=${pkgver}')
conflicts=('todo.c' 'todo' 'todo.cpp')
source=("todo-git::git+http://git.ache.one/todo")

md5sums=('SKIP')

pkgver() {
    cd "$srcdir/todo-git"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd "$srcdir/todo-git"
    make
}

package() {
    cd "$srcdir/todo-git"
    install -Dm755 "todo" "$pkgdir/usr/bin/todo"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/todo.cpp/LICENSE"
}
