# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt5-quickcontrols-nemo
pkgver=5.7.1
pkgrel=1
pkgdesc="QML components for Nemomobile, based on QtQuickControls"
arch=('x86_64')
url="https://github.com/nemomobile-ux/qtquickcontrols-nemo"
license=('LGPL' 'Apache')
depends=('libglacierapp' 'nemo-qml-plugin-configuration' 'nemo-qml-plugin-notifications'
         'nemo-theme-glacier' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-virtualkeyboard')
makedepends=('cmake')
source=("https://github.com/nemomobile-ux/qtquickcontrols-nemo/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ec8bb929db8447c574a6ade3e591b82899d1cee7349df2bc28e48ad0bec5fa1843081f33a77d8df03de4c0dbbce80f9fdef360fa0a798c20c4a4dcde7d147111')

build() {
  cd qtquickcontrols-nemo-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd qtquickcontrols-nemo-$pkgver
  make DESTDIR="$pkgdir" install
}
