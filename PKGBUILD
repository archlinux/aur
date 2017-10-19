# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=vtchs
pkgver=1.1
pkgrel=1
pkgdesc="Listen for VT switches"
arch=(i686 x86_64)
url="https://github.com/maandree/vtchs"
license=('ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(ae8aa9346bd0fa2078620355f0866e5fa2671bf3da89642c48b705644eca0c08)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
