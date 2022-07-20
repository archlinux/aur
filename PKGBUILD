# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=vtchs
pkgver=1.1.2
pkgrel=1
pkgdesc="Listen for VT switches"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/vtchs"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(264d9fe27b9840b2f8029c5c6c39e3454024041bc0a6bdc7d5afb9ea1395b997)

build() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
