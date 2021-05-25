# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-qt-plugins
pkgver=0.1
pkgrel=1
pkgdesc="Unify Qt application style of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/cutefish-qt-plugins"
license=('GPL')
groups=('cutefish')
depends=('kwindowsystem' 'libdbusmenu-qt5' 'libqtxdg' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/qt-plugins/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('adc1fc96035ebe3804b1229e92fc17506bfe574d72882b358a56ad9f1684816f8a0df8314bb92543561a3451beeaaf748336d89c82d1f97b2191ed41253e3eb7')

build() {
  cd qt-plugins-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd qt-plugins-$pkgver
  DESTDIR="$pkgdir" ninja install
}
