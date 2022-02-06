# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-terminal
pkgver=0.7
pkgrel=1
pkgdesc="A terminal emulator for Cutefish"
arch=('x86_64')
url="https://github.com/cutefishos/terminal"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'qt5-svg')
makedepends=('extra-cmake-modules' 'qt5-tools')
source=("https://github.com/cutefishos/terminal/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2378e96dc600c534f66ffa1c50ee7e7aabbdf84dd575134bd2cd3f091d32c5d2aa5fd426abfe4857a6851920b677b80e74a025e30d67b527c2b23b7109c219df')

build() {
  cd terminal-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd terminal-$pkgver
  make DESTDIR="$pkgdir" install
}
