# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt5-quickcontrols-nemo
pkgver=5.6.6
pkgrel=1
pkgdesc="QML components for Nemomobile, based on QtQuickControls"
arch=('x86_64')
url="https://github.com/nemomobile-ux/qtquickcontrols-nemo"
license=('LGPL' 'Apache')
depends=('libglacierapp' 'nemo-qml-plugin-configuration' 'nemo-qml-plugin-notifications'
         'nemo-theme-glacier' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-virtualkeyboard')
source=("https://github.com/nemomobile-ux/qtquickcontrols-nemo/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('54bc674aa6e8e7d4643067ef65f3953c68341e5f30842efb55a35da5c9352f92a931c33c9cd117e81cef8feeff0d3feabb5a2648d1434a73139d56af759727d0')

build() {
  cd qtquickcontrols-nemo-$pkgver
  qmake-qt5
  make
}

package() {
  cd qtquickcontrols-nemo-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
