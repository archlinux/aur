# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libj2
pkgver=1.1
pkgrel=1
pkgdesc="Double-max precision integers"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libj2"
license=('custom:ISC')
depends=()
source=(libj2-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(39e3b9776a324cc4b03704024e52ffa4797373405be5857e1eb1136c997be5fb)


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
