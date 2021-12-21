# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-terminal
pkgver=0.5
pkgrel=1
pkgdesc="A terminal emulator for Cutefish"
arch=('x86_64')
url="https://github.com/cutefishos/terminal"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'qt5-svg')
makedepends=('extra-cmake-modules' 'qt5-tools')
source=("https://github.com/cutefishos/terminal/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('3883ec98cff97f649ef9a5039b8d62bbe902e9098113730b7814494061eeea40e7ff48b92ddf21cbd147c9d0978a468078d4610b226cd353a87402dcc19f6041')

build() {
  cd terminal-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd terminal-$pkgver
  make DESTDIR="$pkgdir" install
}
