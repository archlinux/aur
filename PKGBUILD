# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt5-quickcontrols-nemo
pkgver=5.7.2
pkgrel=1
pkgdesc="QML components for Nemomobile, based on QtQuickControls"
arch=('x86_64')
url="https://github.com/nemomobile-ux/qtquickcontrols-nemo"
license=('LGPL' 'Apache')
depends=('libglacierapp' 'nemo-qml-plugin-configuration' 'nemo-qml-plugin-notifications'
         'nemo-theme-glacier' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-virtualkeyboard')
makedepends=('cmake')
source=("https://github.com/nemomobile-ux/qtquickcontrols-nemo/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('317fed85dbedc9e1120f7d51bd8dcda3f234ea7069f27eb9f999cfadd991f09f19879cb03363cdd5109a846c9e890385587e4118b2d647bb9d689fbbcd1bf265')

build() {
  cd qtquickcontrols-nemo-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd qtquickcontrols-nemo-$pkgver
  make DESTDIR="$pkgdir" install
}
