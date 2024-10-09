# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libhashsum
pkgver=1.1.1
pkgrel=1
pkgdesc="Library for calculating the cryptographic hashes"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libhashsum"
license=('custom:ISC')
depends=(libsha1 libsha2 'libkeccak>=1.3' 'libblake>=3.0')
checkdepends=()
makedepends=()
source=(libhashsum-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(fafef9b55d12ceba32d9343f573ae2e07e7b29a30383c2dbf36ab614d0a9069b)

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
