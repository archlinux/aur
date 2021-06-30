# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-launcher
pkgver=0.3
pkgrel=1
pkgdesc="CutefishOS's full-screen application launcher"
arch=('x86_64')
url="https://github.com/cutefishos/launcher"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'kwindowsystem' 'libcutefish')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/launcher/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('5286ea84a6abd0059ce1eca178af5b6ab37aa80fc095e6f5d4c4b6ee8a87d74304342154cc2ce43c6292d5ec05e1a0b47180da0b4504a2f1456cce6d0624057c')

build() {
  cd launcher-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd launcher-$pkgver
  make DESTDIR="$pkgdir" install
}
