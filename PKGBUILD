# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=libbinio
pkgver=1.5
pkgrel=1
pkgdesc="Binary I/O C++ class library"
url="https://github.com/adplug/libbinio"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs')
source=(https://github.com/adplug/libbinio/releases/download/libbinio-$pkgver/libbinio-$pkgver.tar.bz2)
md5sums=('261046e16f74d1cdbf9aa6c78fa264e4')

build() {
  cd "$srcdir/libbinio-$pkgver"

  ./configure --prefix=/usr --infodir=/usr/share/info
  make
}

package() {
  cd "$srcdir/libbinio-$pkgver"

  make "DESTDIR=$pkgdir" install
}

# vim:set ts=8 sts=2 sw=2 et:
