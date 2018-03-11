# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=xtl
pkgver=0.4.4
pkgrel=1
epoch=
pkgdesc="QuantStack tools library - Basic tools (containers, algorithms) used by other quantstack packages"
arch=('any')
url="https://github.com/QuantStack/xtl"
license=('BSD-3-Clause')
depends=('gcc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/xtl/archive/${pkgver}.tar.gz")
sha512sums=('6f480081a83912c59c529d54dd036197d998346929f6cc79382515c9c1bc7ef7fc1439b7fe73d75748a7eb972e4799a13e33ad2a159c2f5ad7c0a51be0f30eda')

build() {
	cd "${pkgname}-${pkgver}"
  [ ! -d build ] && mkdir build
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..
  make
}

package() {
	cd "${pkgname}-${pkgver}/build"
  make install
}
