# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libj2
pkgver=1.0
pkgrel=1
pkgdesc="Double-max precision integers"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libj2"
license=('custom:ISC')
depends=()
source=(libj2-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(be2482cbad637d3c7119dbf7f0df6d84fb0ee90a0ce173179a6b0b4fd5e427ec)


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
