# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=svgcleaner-gui-git
pkgver=0.6.91.73.gdfd1fd8
pkgrel=1
pkgdesc="main GUI for svgcleaner"
url="https://github.com/RazrFalcon/svgcleaner-gui"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('qt5-tools')
depends=('hicolor-icon-theme' 'qt5-base' 'svgcleaner' 'p7zip')
source=(git+https://github.com/RazrFalcon/svgcleaner-gui)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "0.6.91.%s.g%s"  $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "${pkgname%-git}"
  qmake-qt5 svgcleaner-gui.pro
  make 
}

package() {
  cd "${pkgname%-git}"
  make "INSTALL_ROOT=$pkgdir" install
}
