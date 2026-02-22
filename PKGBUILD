# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=slack
pkgver=3.0.4
pkgrel=1
pkgdesc="Control your timer slack"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/slack"
license=('custom:ISC')
depends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(42e4e7c5d4b9f225d50933d0e73db79ee37bce34dd3cf8e40a621b6d5a048af3)

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
