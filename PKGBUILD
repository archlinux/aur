# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=sha3sum
pkgver=1.1
pkgrel=1
pkgdesc="Keccak-family checksum calculator, including SHA-3"
arch=(i686 x86_64)
url="https://github.com/maandree/sha3sum"
license=('custom:ISC')
depends=(libkeccak)
makedepends=(libkeccak sed)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(71ecdd34b947f8060e43b78431cab4c9066549a2193499c5e12e7d2ec4af92be)


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
