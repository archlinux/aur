# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=pro_office_calc
pkgver=1.0.6
pkgrel=1
pkgdesc="A completely normal office calculator."
arch=('i686' 'x86_64')
url="http://proofficecalculator.com/"
license=('GPL3')
depends=(qt5-base qt5-multimedia tinyxml2)
makedepends=(cmake)
checkdepends=(gtest)
source=("https://github.com/RobJinman/pro_office_calc/archive/v${pkgver}.tar.gz")
md5sums=('92eb7de2705ea6f4a183df0c21616fb5')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -G "Unix Makefiles" ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
