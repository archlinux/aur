# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fishui
pkgver=0.7
pkgrel=1
pkgdesc="GUI library based on QQC2 for Cutefish applications"
arch=('x86_64')
url="https://github.com/cutefishos/fishui"
license=('GPL')
depends=('kwindowsystem' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/fishui/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('64457670544b4968bc8a4ae60c641fdb51dc8bca3c84a5814d2fbb8fcaed1c7198f2609b106d837e5219cb11b2175ee94a0733837fc7659a6a4c1e2f742dc7e8')

build() {
  cd $pkgname-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}
