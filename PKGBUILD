# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libblake
pkgver=1.0
pkgrel=1
pkgdesc="Library for the BLAKE-family of hashing functions"
arch=(i686 x86_64)
url="https://github.com/maandree/libblake"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(4e435aba4f4edef18a1e09b3c20f4618daaa8c9cc4057e3136199ab91c1ba8eb)

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
