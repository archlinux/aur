# Maintainer: Guoyi Zhang <myname at malacology dot net>
pkgname=wfa2-lib
pkgver=2.3.4
pkgrel=1
pkgdesc="Wavefront alignment algorithm library v2"
arch=('x86_64')
url="https://github.com/smarco/WFA2-lib"
license=('MIT')
makedepends=('cmake' 'openmp')
source=(
  "WFA2-lib-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('3a02d19b45c7efcdcabdd956421b1e449e771fca0b0f072e02d7aa65ebb29f23')


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
