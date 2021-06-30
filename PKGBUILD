# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-statusbar
pkgver=0.3
pkgrel=1
pkgdesc="Top status bar of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/statusbar"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'libcutefish' 'libdbusmenu-qt5' 'qt5-svg')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/statusbar/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b023fd1cdd461e93ad102408d0202679a6b122d50861372236e596a77aa7495314c0279ef7c3b1effa3209d2666efb636b70a49dc878bf63d20c9cc2f06de242')

build() {
  cd statusbar-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd statusbar-$pkgver
  make DESTDIR="$pkgdir" install
}
