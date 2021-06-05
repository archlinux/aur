# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fishui
pkgver=0.2
pkgrel=1
pkgdesc="GUI library based on QQC2 for Cutefish applications"
arch=('x86_64')
url="https://github.com/cutefishos/fishui"
license=('GPL')
depends=('kwindowsystem' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/fishui/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('89f93e62d84b29c93aa489be83f04cee110011491e346f609599ddaf1c839a8c111efd7b7fdda98fd12ca865672326028b24f6371eb5fee592bd0b2aea03692a')

build() {
  cd $pkgname-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}
