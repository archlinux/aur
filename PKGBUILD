# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt5-quickcontrols-nemo
pkgver=5.7
pkgrel=1
pkgdesc="QML components for Nemomobile, based on QtQuickControls"
arch=('x86_64')
url="https://github.com/nemomobile-ux/qtquickcontrols-nemo"
license=('LGPL' 'Apache')
depends=('libglacierapp' 'nemo-qml-plugin-configuration' 'nemo-qml-plugin-notifications'
         'nemo-theme-glacier' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-virtualkeyboard')
makedepends=('cmake')
source=("https://github.com/nemomobile-ux/qtquickcontrols-nemo/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('557760c6b2b6a7bec641222bf391646c73b096996be5db2f656cb34e5c5f18668003d820fac12d117e640e85f82b9c0c7ef377264bf2a6c4dd36875f08225e44')

build() {
  cd qtquickcontrols-nemo-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd qtquickcontrols-nemo-$pkgver
  make DESTDIR="$pkgdir" install
}
