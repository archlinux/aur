# Maintainer: Mattias Andrée <`base64 -d`(bWF0dGlhcy5hbmRyZWU)@protonmail.com>

pkgname=libhashsum
pkgver=1.1
pkgrel=1
pkgdesc="Library for calculating the cryptographic hashes"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libhashsum"
license=('custom:ISC')
depends=(libsha1 libsha2 'libkeccak>=1.3' 'libblake>=3.0')
checkdepends=()
makedepends=()
source=(libhashsum-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(449a05fc1d4e5b2de313f865dadd2612e76c2a188452e2323a7758cc20dcf1f7)

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
