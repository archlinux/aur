# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Rafael Beraldo <rafaelluisberaldo@gmail.com>

pkgname=todo.c-git
pkgver=20161020
pkgrel=1
pkgdesc="Command line lightweight todo tool with readable storage , written in C"
arch=("any")
url="https://github.com/hit9/todo.c"
license=('BSD')
makedepends=('git')
provides=('todo.c')
conflicts=('todo.c' 'todo')
source=("$pkgname"::'git+https://github.com/hit9/todo.c.git')
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
    install -Dm755 "src/todo" "$pkgdir/usr/bin/todo"
    install -Dm644 "LICENSE-BSD" "$pkgdir/usr/share/licenses/todo.c/LICENSE-BSD"
}
