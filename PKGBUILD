# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=xtl
pkgver=0.5.4
pkgrel=1
pkgdesc="QuantStack tools library - Basic tools (containers, algorithms) used by other quantstack packages"
arch=('any')
url="https://github.com/QuantStack/xtl"
license=('BSD-3-Clause')
depends=('gcc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/xtl/archive/${pkgver}.tar.gz")
sha512sums=('6181334dda9a2afce4ce2809572605c2f911770f7805a8328e14fa94d4572475c7725f2ead54daec00e62933df6a4c22616a247798c5b7f1f3bd4290945776c8')

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
