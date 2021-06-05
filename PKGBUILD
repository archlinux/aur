# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-qt-plugins
pkgver=0.2
pkgrel=1
pkgdesc="Unify Qt application style of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/qt-plugins"
license=('GPL')
groups=('cutefish')
depends=('kwindowsystem' 'libdbusmenu-qt5' 'libqtxdg' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/qt-plugins/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('def5751287d6ae7ef759118e6b8e6e29c4784946561f1b3e6bb9600a40b0c31da6c0ba1b5ad66eeef9406a2ced1a4ba8fd3894f5ccbcf775dfa7c72f61a5d5cb')

build() {
  cd qt-plugins-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd qt-plugins-$pkgver
  DESTDIR="$pkgdir" ninja install
}
