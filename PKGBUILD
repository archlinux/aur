# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=slack
pkgver=3.0.3
pkgrel=1
pkgdesc="Control your timer slack"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/slack"
license=('custom:ISC')
depends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(8b62d03632250a584fbe5e21ed7cc0722547c4f74173f254bd6378a60cc7a211)

build() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr
}

check() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr check
}

package() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
