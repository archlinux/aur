# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libabort
pkgver=1.0
pkgrel=1
pkgdesc="String functions that abort(3) when getting out of bounds"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libabort"
license=('ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(043f7da8d3c12d7b5395033398b218addd791b82072f0e2938333703b3013a11)


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
