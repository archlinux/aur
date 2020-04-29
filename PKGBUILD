# Maintainer: Alexander Susha <isushik94@gmail.com>
# Maintainer : Nathan Owens <ndowens @ artixlinux.org>

pkgname=xtensor-io
pkgver=0.7.0
pkgrel=1
pkgdesc="QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing."
arch=('x86_64')
url="https://github.com/QuantStack/${pkgname}"
license=('BSD-3-Clause')
depends=('xtensor' 'xtl' 'openimageio' 'libsndfile' 'zlib')
makedepends=('cmake' 'git')
source=("git+https://github.com/QuantStack/xtensor-io.git#tag=${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${pkgname}"
  mkdir build
  
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make -C build
}

package() {
  cd "${pkgname}"
  make -C build install
}
