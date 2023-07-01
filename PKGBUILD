# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=python-bus
pkgver=3.1.3.1
pkgrel=1
pkgdesc="Python 3 module for bus"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/python-bus"
license=('ISC')
depends=(bus python)
makedepends=(cython)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(05fa58d1275fd570e4fda778ca935f5e047e69cbf12fed128cd41dc4eae42ff2)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
