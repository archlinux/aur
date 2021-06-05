# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-statusbar
pkgver=0.2
pkgrel=1
pkgdesc="Top status bar of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/statusbar"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'libcutefish' 'libdbusmenu-qt5' 'qt5-svg')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/statusbar/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('666e565e1b7fa0580decd32896d0730e5c12746d4cb94e730683e27ea223c40cb9867da8ee34cf7ba4fb9788afda660c7717ed8faba2a5cc1782072ed94875c5')

build() {
  cd statusbar-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd statusbar-$pkgver
  make DESTDIR="$pkgdir" install
}
