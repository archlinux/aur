# Maintainer: Guoyi Zhang <myname at malacology dot net>
pkgname=wfa2-lib
pkgver=2.3.3
pkgrel=1
pkgdesc="Wavefront alignment algorithm library v2"
arch=('x86_64')
url="https://github.com/smarco/WFA2-lib"
license=('MIT')
makedepends=('cmake' 'openmp')
source=(
  "WFA2-lib-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('2569650cdba395f42513a4d2c9175724a736047bb7da99a162c0abdbd651698f')


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
