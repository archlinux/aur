# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt5-quickcontrols-nemo
pkgver=5.7.6
pkgrel=1
pkgdesc="QML components for Nemomobile, based on QtQuickControls"
arch=('x86_64')
url="https://github.com/nemomobile-ux/qtquickcontrols-nemo"
license=('LGPL' 'Apache')
depends=('nemo-qml-plugin-configuration'
         'nemo-theme-glacier' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-virtualkeyboard')
makedepends=('cmake' 'git')
source=("git+https://github.com/nemomobile-ux/qtquickcontrols-nemo.git#tag=$pkgver")
sha512sums=('55fe891b8e6983adcc57b57f5c1879cf898d32d5f6369f3dd934276e2f7516969a185d8655de78d8ff88b6698c2695d62835302dff9764e3b1fd9e993fc4dee1')

build() {
  cd qtquickcontrols-nemo
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd qtquickcontrols-nemo
  make DESTDIR="$pkgdir" install
}
