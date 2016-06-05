# Maintainer: Tarn Burton <twburton at gmail dot com>

pkgname=normaliz
pkgver=3.1.1
pkgrel=1
pkgdesc="A tool for computations in affine monoids, vector configurations, lattice polytopes, and rational cones."
arch=('i686' 'x86_64')
url="https://www.normaliz.uni-osnabrueck.de/"
license=('GPL')
depends=('gmp')
makedepends=('cmake' 'boost')
source=("https://www.normaliz.uni-osnabrueck.de/wp-content/uploads/2016/04/Normaliz3.1.1Source.zip")
md5sums=('35db0c9c795631764b3ee563fa98670c')

build() {
  cd $srcdir/Normaliz3.1/source
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $srcdir/Normaliz3.1/source/build
  make DESTDIR=$pkgdir install
}
