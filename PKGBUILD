# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libj2
pkgver=1.2.2
pkgrel=1
pkgdesc="Double-max precision integers"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libj2"
license=('custom:ISC')
depends=()
source=(libj2-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(9e3c33991e5fd2cbd2a0a258ad2d7f2ebb09c228069b898768f0a2a9fad62b02)


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
