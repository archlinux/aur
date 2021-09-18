# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libsha2
pkgver=1.0.3
pkgrel=1
pkgdesc="SHA-2-family hashing library"
arch=(i686 x86_64)
url="https://github.com/maandree/libsha2"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(libsha2-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(daa41781ffb6d2638fe36ceff26fea147a1bb40e63ffba189f1c10b3d4e08524)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
