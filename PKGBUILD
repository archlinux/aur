# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=featherpad
pkgver=0.9.4
pkgrel=1
pkgdesc='Lightweight Qt5 plain text editor for Linux'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/FeatherPad'
license=('GPL3')
depends=('qt5-svg' 'qt5-x11extras' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('qt5-tools')
optdepends=('qt5-translations: localized keyboard shortcuts')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tsujan/FeatherPad/archive/V$pkgver.tar.gz")
sha256sums=('6833ebc541550c0cac4c5e47f0870eb0209f0d779dfeef7273b6287896d46ef6')

build() {
  rm -Rf build && mkdir build
  cd build
  qmake $srcdir/FeatherPad-$pkgver/
  make
}

package() {
  cd build
  make INSTALL_ROOT=$pkgdir install
}
