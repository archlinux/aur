# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt5-quickcontrols-nemo
pkgver=5.6.5
pkgrel=1
pkgdesc="QML components for Nemomobile, based on QtQuickControls"
arch=('x86_64')
url="https://github.com/nemomobile-ux/qtquickcontrols-nemo"
license=('LGPL' 'Apache')
depends=('libglacierapp' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-virtualkeyboard')
source=("https://github.com/nemomobile-ux/qtquickcontrols-nemo/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('70e09f576549025ad881ae271aae501520df6017ba0d9aeb36430887c9df96ff01f0656c82e60e8fc73aaf2f20d8c1b82c6f297f595f4d20b36b8d709d1c455a')

build() {
  cd qtquickcontrols-nemo-$pkgver
  qmake-qt5
  make
}

package() {
  cd qtquickcontrols-nemo-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
