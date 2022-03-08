# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-launcher
pkgver=0.8
pkgrel=1
pkgdesc="CutefishOS's full-screen application launcher"
arch=('x86_64')
url="https://github.com/cutefishos/launcher"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'kwindowsystem' 'libcutefish')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/launcher/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c439e259bb7e82ba2dacac55f792a3d78db6c4c2c194d01a1ac0dc36ff73c632dce1accd4617bd6e693bea828951dc6a4afdb6e9ad098eced7defcae7447833b')

build() {
  cd launcher-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd launcher-$pkgver
  make DESTDIR="$pkgdir" install
}
