# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=svgcleaner-gui
pkgver=0.9.5
pkgrel=1
pkgdesc="main GUI for svgcleaner"
url="https://github.com/RazrFalcon/svgcleaner-gui"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
license=(GPL2)
depends=(qt5-base svgcleaner)
makedepends=(qt5-tools qt5-svg)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/RazrFalcon/svgcleaner-gui/archive/v${pkgver}.tar.gz)
sha256sums=('71b325614407bd5dd137b3c71cc352777e81621b14f730ac68cbc2cbd1950c39')

build() {
  cd "$pkgname-$pkgver"
  qmake svgcleaner-gui.pro
  make 
}

package() {
  cd "$pkgname-$pkgver"
  make "INSTALL_ROOT=$pkgdir" install
}
