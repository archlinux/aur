# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-core
pkgver=0.3
pkgrel=1
pkgdesc="System components and backend of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/core"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'libpulse' 'libxtst' 'polkit-qt5')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/core/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('86100d08db3f5c52561d2361228396a69f8d7621d039e125da349fa10f8b7716f38d090a936df8b2aa1d4797d6a40aa06147d40b51b5859b75de7f4bb9ea2dc1')

build() {
  cd core-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd core-$pkgver
  make DESTDIR="$pkgdir" install
}
