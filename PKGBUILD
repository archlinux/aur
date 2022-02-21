# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fishui
pkgver=0.8
pkgrel=1
pkgdesc="GUI library based on QQC2 for Cutefish applications"
arch=('x86_64')
url="https://github.com/cutefishos/fishui"
license=('GPL')
depends=('kwindowsystem' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/fishui/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9cfbf51901aa79341b66bdbd21f87b480ec9a6640aec09f56e9e046b5aa88ee05a890c1872ac47bed1eb053b9ce958d189b7e9287908708e7bed6ae5f0946cb6')

build() {
  cd $pkgname-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}
