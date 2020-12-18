# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=xtensor
pkgver=0.21.5
pkgrel=2
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
sha512sums=('d06f96225bf82ead7dfcc202a3bfdc61b99e470a4e5ae29f3108c51607e8b2f82e2fc2250ece20e42224d37a464d8b56d212b792e26c5d80c6a01328cf7506c8')
