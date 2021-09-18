# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=vtchs
pkgver=1.1.2
pkgrel=1
pkgdesc="Listen for VT switches"
arch=(i686 x86_64)
url="https://github.com/maandree/vtchs"
license=('ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(94e790982663e384f8df57beea3ae7a3426246151c47f22fa4ca7ad5b0734dbf)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
