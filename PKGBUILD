# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=xtensor
pkgver=0.23.7
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
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..
  make -C "${pkgname}-${pkgver}/build"
}

package() {
  cd ${pkgname}-${pkgver}
  make -C build DESTDIR="${pkgdir}" install
}
sha512sums=('50cfb13ae962b4d1acb005e295d5a4d7265106f4e38fed9e5c75e30f9abc13b149720a8a1e55e38938c7fab7db38b6807f406f380a6785821eab6c2d2a1c675a')
