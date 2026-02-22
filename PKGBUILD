# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libj2
pkgver=1.2.1
pkgrel=1
pkgdesc="Double-max precision integers"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libj2"
license=('custom:ISC')
depends=()
source=(libj2-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(c25ab4cd79d5483aaed32edf70ce7232e4e81790710003a396af6cb1ace1b912)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


check() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr check
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
