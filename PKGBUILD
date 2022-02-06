# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-statusbar
pkgver=0.7
pkgrel=1
pkgdesc="Top status bar of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/statusbar"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'libcutefish' 'libdbusmenu-qt5' 'qt5-svg')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/statusbar/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('d1f54e9e0da3ee3219abf7ecea84e285ba3333919a8017ba4bc1c355fe50fbc00aaa5056eb338acd8d56b4cd7ec7fd09812f674d2f15d5ac196beb490cc0733f')

build() {
  cd statusbar-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd statusbar-$pkgver
  make DESTDIR="$pkgdir" install
}
