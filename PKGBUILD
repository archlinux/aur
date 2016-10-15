# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=featherpad
pkgver=0.5.8
pkgrel=1
pkgdesc='Lightweight Qt5 plain text editor for Linux'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/FeatherPad'
license=('GPL3')
depends=('qt5-svg' 'qt5-x11extras' 'desktop-file-utils' 'gtk-update-icon-cache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tsujan/FeatherPad/archive/V$pkgver.tar.gz")
sha256sums=('cc4165cee345967211a3321c2dba90acb88fb13acce688fd5c4aff2327b49c62')

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
