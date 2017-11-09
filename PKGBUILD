# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-qt5
pkgver=1.2.0
pkgrel=1
pkgdesc="Qt5 IM Module for Fcitx"
arch=('x86_64')
url="https://github.com/fcitx/fcitx-qt5"
license=('GPL')
groups=('fcitx-im')
depends=('fcitx' 'libxkbcommon' 'qt5-base')
makedepends=('extra-cmake-modules')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fcitx/fcitx-qt5/archive/$pkgver.tar.gz")
sha512sums=('2e8b551f5247a2268228d0e3b7b8a185bb834f413d5d9048ee965b69a53c70dbe45490869971434a926c304dc3d9636eaf903cd0f477d782ffe4aea79291d9cb')

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib .
  make
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir"
}
