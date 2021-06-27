# Maintainer: lmartinez-mirror
pkgname=thermofun
pkgver=0.3.8
pkgrel=1
pkgdesc="Library for calculating standard state thermodynamic properties"
arch=('x86_64')
url="https://github.com/thermohub/thermofun"
license=('LGPL3')
depends=('gcc-libs')
makedepends=('cmake' 'nlohmann-json' 'pybind11' 'python-setuptools')
provides=('libThermoFun.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1daffed5ca3b6187548729da9884f63c76c02af4dd6cb7e649a898b016353c6f')

build() {
  cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -DCMAKE_SKIP_RPATH=YES \
    -S "$pkgname-$pkgver" \
    -B build
  make -C build
}

package() {
  make install -C build
}
