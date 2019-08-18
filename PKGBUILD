# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=suwidgets-git
pkgver=r5.26f87aa
pkgrel=2
pkgdesc="Sigutils-related widgets"
arch=(any)
license=('custom')
url="https://github.com/BatchDrake/SuWidgets"
depends=('qt5-base')
makedepends=('git' 'gcc')
provides=('suwidgets')
conflicts=('suwidgets')
source=("$pkgname::git+https://github.com/BatchDrake/SuWidgets.git")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  qmake SuWidgetsLib.pro
}

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  INSTALL_ROOT=${pkgdir} make install
}
