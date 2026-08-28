# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt5-quickcontrols-nemo
pkgver=5.7.5
pkgrel=1
pkgdesc="QML components for Nemomobile, based on QtQuickControls"
arch=('x86_64')
url="https://github.com/nemomobile-ux/qtquickcontrols-nemo"
license=('LGPL' 'Apache')
depends=('nemo-qml-plugin-configuration'
         'nemo-theme-glacier' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-virtualkeyboard')
makedepends=('cmake' 'git')
source=("git+https://github.com/nemomobile-ux/qtquickcontrols-nemo.git#tag=$pkgver")
sha512sums=('2481c183ed500c2a3f074a4bc80d1e61d474855b80eb21a0ad53dc93af00f9d3dd1a9206a420d23be72d5909a3e023272f57dcd8727fa39d560765e6ef2b590e')

build() {
  cd qtquickcontrols-nemo
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd qtquickcontrols-nemo
  make DESTDIR="$pkgdir" install
}
