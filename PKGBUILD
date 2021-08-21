# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-terminal
pkgver=0.4
pkgrel=2
pkgdesc="A terminal emulator for Cutefish"
arch=('x86_64')
url="https://github.com/cutefishos/terminal"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'qt5-svg')
makedepends=('extra-cmake-modules' 'qt5-tools')
source=("https://github.com/cutefishos/terminal/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('900d9419a63e91dc7841e7c39aa8acdd67f9bd6215bd0b4751c1ad5b025bf219eae90e041fd7b02fa4e3cb9ccd8093cee1e442db57479161fd890fd7fe28cc22')

build() {
  cd terminal-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd terminal-$pkgver
  make DESTDIR="$pkgdir" install
}
