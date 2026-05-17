# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libj2
pkgver=1.2.3
pkgrel=1
pkgdesc="Double-max precision integers"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libj2"
license=('custom:ISC')
depends=()
source=(libj2-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(5d53569d40f1ade0e8984d27538552ac7411f0c569b861861e45453faef061e4)


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
