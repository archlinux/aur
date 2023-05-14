# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Zdenek Janak <janak@astronomie.cz>

pkgname=munipack
pkgver=0.6.1
pkgrel=1
pkgdesc="A general astronomical image processing software"
arch=(x86_64)
url="http://munipack.physics.muni.cz"
license=(GPL3)
depends=(
  cfitsio
  libminpack
  liboakleaf
  plplot
  python-matplotlib
  python-numpy
  wxgtk3
)
makedepends=(gcc-fortran)

source=(ftp://munipack.physics.muni.cz/pub/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('8a34e320b2c088269483178c28e02f5a800b0426d3cc46ced686cb1d1cc7d57f')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

package() {
  cd "$_archive"

  make DESTDIR="$pkgdir/" install
}
