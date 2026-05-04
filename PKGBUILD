# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=coopgammad
pkgver=1.3.3
pkgrel=1
pkgdesc="Cooperative gamma server"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/coopgammad"
license=('custom:ISC')
depends=(libgamma)
makedepends=(libgamma libclut)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(53909602c751370636441c6421742c28ff15e7fc810b92c05382b0b22567e6f2)


build () {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package () {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
