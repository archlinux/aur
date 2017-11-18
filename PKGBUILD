# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=sha3sum
pkgver=1.1.4
pkgrel=1
pkgdesc="Keccak-family checksum calculator, including SHA-3"
arch=(i686 x86_64)
url="https://github.com/maandree/sha3sum"
license=('custom:ISC')
depends=(libkeccak)
makedepends=(libkeccak sed)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(3143bc3214d83372e28a2ad72956250c23f6f89804a44aa950aba5d17d494273)


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
