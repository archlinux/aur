# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-launcher
pkgver=0.1
pkgrel=2
pkgdesc="CutefishOS's full-screen application launcher"
arch=('x86_64')
url="https://github.com/cutefishos/launcher"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'kwindowsystem' 'libcutefish')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/launcher/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e331fc05419bb154d8cc90b910dd4055a6659d831894cd8973123e2c1f9fc2bc439edfcdc42052d57fa001b984e258c7c1aff828c48a08fd69fb1bedfd231fea')

build() {
  cd launcher-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd launcher-$pkgver
  make DESTDIR="$pkgdir" install
}
