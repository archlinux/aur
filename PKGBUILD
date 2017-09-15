# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-qt5
pkgver=1.1.1
pkgrel=1
pkgdesc="Qt5 IM Module for Fcitx"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-qt5"
license=('GPL')
groups=('fcitx-im')
depends=('fcitx' 'libxkbcommon' 'qt5-base=5.9.1')
makedepends=('extra-cmake-modules')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fcitx/fcitx-qt5/archive/$pkgver.tar.gz")
sha512sums=('57aeb4d7b2d0b502619324efb19d17f0ede431ed5aa6300f4b5213538a00d6cc57cf8858e84719c39bf0e0bb6433df3d15f61d4da6e47690b906a66b0f356221')

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib .
  make
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir"
}
