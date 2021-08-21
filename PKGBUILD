# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fishui
pkgver=0.4
pkgrel=2
pkgdesc="GUI library based on QQC2 for Cutefish applications"
arch=('x86_64')
url="https://github.com/cutefishos/fishui"
license=('GPL')
depends=('kwindowsystem' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/fishui/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('8a68651603bb89097c8f6343f85315173263fd0dfc7f61e59d480e1dfb91f28b278571d267f1233900ee17c5e1c333e0dbf5b519df48ef9ed060b6d068c81a10')

build() {
  cd $pkgname-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}
