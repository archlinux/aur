# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=xtensor
pkgver=0.24.7
pkgrel=1
pkgdesc="C++ tensors with broadcasting and lazy computing"
arch=('x86_64')
url="https://github.com/xtensor-stack/${pkgname}"
license=('BSD-3-Clause')
depends=('xtl')
makedepends=('gcc' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")

build() {
  cmake -B "${pkgname}-${pkgver}/build" -S "${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make -C "${pkgname}-${pkgver}/build"
}

package() {
  cd ${pkgname}-${pkgver}
  make -C build DESTDIR="${pkgdir}" install
}
sha256sums=('0fbbd524dde2199b731b6af99b16063780de6cf1d0d6cb1f3f4d4ceb318f3106')
