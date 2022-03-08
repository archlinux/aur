# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-dock
pkgver=0.8
pkgrel=1
pkgdesc="CutefishOS application dock"
arch=('x86_64')
url="https://github.com/cutefishos/dock"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'qt5-svg')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/dock/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('98d97abcbc82afd31e13fff3f76bc81f12ba2ab2c1fdcec3c0c800d1945d9353bb7d7086d3d79ae0edc397db025a76afcd7e09e2e68ab60f07770bd3931515d7')

build() {
  cd dock-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd dock-$pkgver
  make DESTDIR="$pkgdir" install
}
