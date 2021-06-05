# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-core
pkgver=0.2
pkgrel=1
pkgdesc="System components and backend of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/core"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'libpulse' 'libxtst' 'polkit-qt5')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/core/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('57894063b0dc1d861a47b764a4fd9d29abb7eb6aa5dd5cb940a787f5c03ed49c233812c700894a469d967c6abbeefab7556ef42472c00f417a64a817da698618')

build() {
  cd core-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd core-$pkgver
  make DESTDIR="$pkgdir" install
}
