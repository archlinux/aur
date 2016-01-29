# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F
# Contributor: Maxime de Roucy <maxime.deroucy@gmail.com>
# Contributor: Joel Schaerer <joel.schaerer@laposte.net>

pkgname=itpp
pkgver=4.3.1
pkgrel=1
pkgdesc="C++ library of mathematical, signal processing and communication routines"
arch=('i686' 'x86_64')
url="http://itpp.sourceforge.net/"
license=('GPL')
depends=('blas' 'lapack' 'fftw' 'perl')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/project/itpp/itpp/${pkgver}/itpp-${pkgver}.tar.bz2")
md5sums=('94f3dac6df2bb829819d0aa99b501933')


build() {
  cd itpp-$pkgver
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "itpp-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
