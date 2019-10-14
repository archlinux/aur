# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=featherpad
pkgver=0.11.0
pkgrel=1
pkgdesc='Lightweight Qt5 plain text editor for Linux'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/FeatherPad'
license=('GPL3')
depends=('qt5-svg' 'qt5-x11extras' 'hunspell' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('qt5-tools')
optdepends=('qt5-translations: localized keyboard shortcuts')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tsujan/FeatherPad/archive/V$pkgver.tar.gz")
sha256sums=('330fee374744b555057e26bbf0019c8bcc2f581ef6a6b2ddefe4338dd24eb378')

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
