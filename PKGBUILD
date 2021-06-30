# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-qt-plugins
pkgver=0.3
pkgrel=1
pkgdesc="Unify Qt application style of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/qt-plugins"
license=('GPL')
groups=('cutefish')
depends=('kwindowsystem' 'libdbusmenu-qt5' 'libqtxdg' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/qt-plugins/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('69bc440e6285be6fc702d5f27b2178e009f9609af2658700555d295a4584c82636821b9b1fe30e4b2511d6e68612b9bc131480f388c7d9395e45381d9b6258c2')

build() {
  cd qt-plugins-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd qt-plugins-$pkgver
  DESTDIR="$pkgdir" ninja install
}
