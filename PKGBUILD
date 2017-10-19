# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=sha3sum
pkgver=1.1.2
pkgrel=1
pkgdesc="Keccak-family checksum calculator, including SHA-3"
arch=(i686 x86_64)
url="https://github.com/maandree/sha3sum"
license=('custom:ISC')
depends=(libkeccak)
makedepends=(libkeccak sed)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(c2bc3e7861b1270dbd1fe735d6b7f1da544921d7d4e978e98c6c77b651c28cb2)


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
