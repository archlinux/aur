# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=coopgammad
pkgver=1.3.2
pkgrel=1
pkgdesc="Cooperative gamma server"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/coopgammad"
license=('custom:ISC')
depends=(libgamma)
makedepends=(libgamma libclut)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(5bfa0c2400d2ab792105c0efdae2db865ee87fbb972873cf60382409024b51e3)


build () {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package () {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
