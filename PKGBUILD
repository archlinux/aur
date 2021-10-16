# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fishui
pkgver=0.5
pkgrel=1
pkgdesc="GUI library based on QQC2 for Cutefish applications"
arch=('x86_64')
url="https://github.com/cutefishos/fishui"
license=('GPL')
depends=('kwindowsystem' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/fishui/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('562d435d210f098c955e24b95a89cbb1ab790635092814a4dc9c0df2c8c5aef963e2ae2c97f46b2e26a01a6875e50b26db1e58338794983cb010ea1ac6ada13a')

build() {
  cd $pkgname-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}
