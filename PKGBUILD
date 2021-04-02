# Maintainer: lmartinez-mirror
pkgname=thermofun
pkgver=0.3.7
pkgrel=1
pkgdesc="Library for calculating standard state thermodynamic properties"
arch=('x86_64')
url="https://github.com/thermohub/thermofun"
license=('LGPL3')
depends=('gcc-libs')
makedepends=('cmake' 'nlohmann-json' 'pybind11' 'python-setuptools')
provides=('libThermoFun.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0cf7c9c09e83f56d6d0b43e1c57bc1e1595a6002e87cd2ccf3ec519f2be5323c')

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
