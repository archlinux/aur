# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=featherpad
pkgver=0.12.1
pkgrel=1
pkgdesc='Lightweight Qt5 plain text editor for Linux'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/FeatherPad'
license=('GPL3')
depends=('qt5-svg' 'qt5-x11extras' 'hunspell' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('qt5-tools')
optdepends=('qt5-translations: localized keyboard shortcuts')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tsujan/FeatherPad/archive/V$pkgver.tar.gz")
sha256sums=('c32d662003591d612731e7c7086a5c7d8c59093141c414ec970d68605099c74f')

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
