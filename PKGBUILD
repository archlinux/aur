# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=featherpad
pkgver=0.13.0
pkgrel=1
pkgdesc='Lightweight Qt5 plain text editor for Linux'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/FeatherPad'
license=('GPL3')
depends=('qt5-svg' 'qt5-x11extras' 'hunspell' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('qt5-tools')
optdepends=('qt5-translations: localized keyboard shortcuts')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tsujan/FeatherPad/archive/V$pkgver.tar.gz")
sha256sums=('13b866fa92d23bf726d3fd1797a08290d47d4cb0ca09b98fab2da2c0be73ac5d')

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
