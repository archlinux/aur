# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-statusbar
pkgver=0.4
pkgrel=1
pkgdesc="Top status bar of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/statusbar"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'libcutefish' 'libdbusmenu-qt5' 'qt5-svg')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/statusbar/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6e2786808ca003fc3bc06ca52bcfb29a8c46a590afbde99c85ecf70a79c47f32bd998598e18fee656e025a1710082fb2cb5e9d135b8c0f7821c2afc162757389')

build() {
  cd statusbar-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd statusbar-$pkgver
  make DESTDIR="$pkgdir" install
}
