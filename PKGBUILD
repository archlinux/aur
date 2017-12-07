# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-qt5
pkgver=1.2.1
pkgrel=2
pkgdesc="Qt5 IM Module for Fcitx"
arch=('x86_64')
url="https://github.com/fcitx/fcitx-qt5"
license=('GPL')
groups=('fcitx-im')
depends=('fcitx' 'libxkbcommon' 'qt5-base')
makedepends=('extra-cmake-modules')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fcitx/fcitx-qt5/archive/$pkgver.tar.gz")
sha512sums=('33e925cc423c4d9441834ddb5c813599307ce04afab1071c328e3de3b83a6bc965a493360b9f7a6a19cb3d4871f9c993d5b69cd5882a7bffe0b197b8f1827d09')

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib .
  make
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir"
}
