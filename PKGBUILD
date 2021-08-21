# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-calculator
pkgver=0.4
pkgrel=2
pkgdesc="CutefishOS Calculator"
arch=('x86_64')
url="https://github.com/cutefishos/calculator"
license=('GPL')
groups=('cutefish')
depends=('fishui')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/calculator/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2c9bf5b7cf749066a87440c101658b33e4cc99f4510f0efd44a91ba0cd25a1c39414d3c8f4a4dbfa1204d4856a195f16e746985463950b93f87790fece74a0ec')

build() {
  cd calculator-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd calculator-$pkgver
  make DESTDIR="$pkgdir" install
}
