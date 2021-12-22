# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-qt-plugins
pkgver=0.5
pkgrel=1
pkgdesc="Unify Qt application style of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/qt-plugins"
license=('GPL')
groups=('cutefish')
depends=('kwindowsystem' 'libdbusmenu-qt5' 'libqtxdg' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/qt-plugins/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ac1e614d41e202cc94125dc5862d8d31b746daa1f1509a775b3e7c084b815f284f1dbd221337b784af0488c50c832af25f4ee0951739fc1e4549e511638d0a95')

build() {
  cd qt-plugins-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd qt-plugins-$pkgver
  DESTDIR="$pkgdir" ninja install
}
