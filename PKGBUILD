# Maintainer: Mark Vainomaa <mikroskeem@mikroskeem.eu>
pkgname=gwsocket-git
pkgver=r67.85aaad3
pkgrel=1
pkgdesc="gwsocket is a simple, standalone, language-agnostic, RFC6455 compliant WebSocket Server, written in C."
arch=("x86_64" "i686")
url="http://gwsocket.io/"
license=('MIT')
provides=("gwsocket")
conflicts=("gwsocket")
replaces=("gwsocket")
source=('gwsocket-git::git+https://github.com/allinurl/gwsocket')
md5sums=('SKIP')


pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    autoreconf -fiv
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install
}
