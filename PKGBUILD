# Maintainer: Guoyi Zhang <myname at malacology dot net>
pkgname=wfa2-lib
pkgver=2.3.5
pkgrel=1
pkgdesc="Wavefront alignment algorithm library v2"
arch=('x86_64')
url="https://github.com/smarco/WFA2-lib"
license=('MIT')
makedepends=('cmake' 'openmp')
source=(
  "WFA2-lib-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('2609d5f267f4dd91dce1776385b5a24a2f1aa625ac844ce0c3571c69178afe6e')


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
