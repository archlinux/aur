# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=coopgammad
pkgver=1.3.4
pkgrel=1
pkgdesc="Cooperative gamma server"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/coopgammad"
license=('custom:ISC')
depends=(libgamma)
makedepends=(libgamma libclut)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(e376c5fec69e1ac1a6579567dc41382330171226c2cf066e65dd91e4daad8a02)


build () {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package () {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
