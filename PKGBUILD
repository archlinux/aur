# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=xtensor
pkgver=0.23.10
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
sha512sums=('032f2a042c3b4967d8513d7ae9f44112a78f34a82e711256dbb3781247ca7a9956b6e3ecd7de9dbf478ab86c23631ab3c6f0b31a10f9f695cf913bcaf057b224')
