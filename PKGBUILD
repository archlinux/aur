# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libhashsum
pkgver=1.0
pkgrel=1
pkgdesc="Library for calculating the cryptographic hashes"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libhashsum"
license=('custom:ISC')
depends=(libsha1 libsha2 'libkeccak>=1.3' 'libblake>=3.0')
checkdepends=()
makedepends=()
source=(libhashsum-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(3461a56113f9a56662243f5b92a22cad4b17c20f8e2b6395711806115b29ddfb)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

check() {
  cd "$srcdir/$pkgname"
  make check
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
