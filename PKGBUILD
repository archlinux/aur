# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=xtl
pkgver=0.7.5
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
    -DCMAKE_INSTALL_LIBDIR=lib
  make -C "${pkgname}-${pkgver}/build"
}

package() {
  cd ${pkgname}-${pkgver}
  make -C build DESTDIR="${pkgdir}" install
}
sha256sums=('3286fef5fee5d58f82f7b91375cd449c819848584bae9367893501114d923cbe')
