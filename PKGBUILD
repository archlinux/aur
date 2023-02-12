# Maintainer: Guoyi Zhang <myname at malacology dot net>
pkgname=wfa2-lib
pkgver=2.3.2
pkgrel=1
pkgdesc="Wavefront alignment algorithm library v2"
arch=('x86_64')
url="https://github.com/smarco/WFA2-lib"
license=('MIT')
makedepends=('cmake' 'openmp')
source=(
  "WFA2-lib-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('310e3886506ab57d04205cdf5fed3ef31969ce39e9c6d341fd5c8a0d4aa0830b')


build() {
  cd ${srcdir}
  mkdir build
  cmake -S WFA2-lib-${pkgver} -B build \
    -DCMAKE_BUILD_TYPE=None -DBUILD_SHARED_LIBS=ON -DOPENMP=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build

}

package() {
  cd build
  make install DESTDIR="$pkgdir"
}
