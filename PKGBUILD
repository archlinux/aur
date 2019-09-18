# Maintainer: ache <ache@ache.one>

pkgname=todo.cpp-git
pkgver=0.8.0
pkgrel=1
pkgdesc="A todo list tool written in C++"
arch=("any")
url="https://git.ache.one/todo"
license=('GPL3')
makedepends=('git')
provides=("todo")
source=("todo::git+https://git.ache.one/todo")

md5sums=('SKIP')

pkgver() {
    cd "$srcdir/todo"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd "$srcdir/todo"
    make
}

package() {
    cd "$srcdir/todo"
    install -Dm755 "todo" "$pkgdir/usr/bin/todo"
}

