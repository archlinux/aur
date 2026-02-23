# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libhashsum
pkgver=1.1.2
pkgrel=1
pkgdesc="Library for calculating the cryptographic hashes"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libhashsum"
license=('custom:ISC')
depends=(libsha1 libsha2 'libkeccak>=1.3' 'libblake>=3.0')
checkdepends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(4decedaceb748a78fbfc90e7bec05bdeb626c53d0b418d4bb224b46cedc3cb2e)

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
