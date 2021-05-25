# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-calculator
pkgver=0.1
pkgrel=2
pkgdesc="CutefishOS Calculator"
arch=('x86_64')
url="https://github.com/cutefishos/calculator"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'libcutefish')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/calculator/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('30f54a2a62e1da5c41cb4a8b79cf9fad014cf59206c8f13d148ec7544754c042ce08126fde628b5ead0b1c4e6fee7e83c8154b45cc9be7a53ae258f726eb0aed')

build() {
  cd calculator-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd calculator-$pkgver
  make DESTDIR="$pkgdir" install
}
