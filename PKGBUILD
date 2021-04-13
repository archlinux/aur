# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=xtl
pkgver=0.7.2
pkgrel=1
pkgdesc="The x template library"
arch=('any')
url="https://github.com/xtensor-stack/${pkgname}"
license=('BSD-3-Clause')
depends=('gcc')
makedepends=('cmake')
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
sha512sums=('b7d694c719337fcf94219943348d2bc096e774b206760abce380a7723334c3a5cad2ff7060df4e184cb825ecac0c242d1467d6c63c2ecc6774fcaae4fc1be124')
