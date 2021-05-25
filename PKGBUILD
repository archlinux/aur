# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-statusbar
pkgver=0.1
pkgrel=1
pkgdesc="Top status bar of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/statusbar"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'libdbusmenu-qt5' 'qt5-svg')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/statusbar/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('631bdd4154f7d114f7ef39fcbadde6a0bded1bbd396d58ec61f30e1c479713645a0d57f7e08b9aa40609f270219487b19bb836d36be1164e3d3ca698bdeb2694')

build() {
  cd statusbar-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd statusbar-$pkgver
  make DESTDIR="$pkgdir" install
}
