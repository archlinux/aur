# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=xtensor
pkgver=0.23.5
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
sha512sums=('351cd967b94f49ede351c2c0b3a9ca32f6975478ac49fe8e676ae2349484eb104d0fd9d5edc86f488f4606726797035fa729cb0f456862f00eef303f9537326e')
