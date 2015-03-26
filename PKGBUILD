# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-qt5
pkgver=1.0.1
pkgrel=1
pkgdesc="Qt5 IM Module for Fcitx"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx' 'qt5-base=5.4.1')
makedepends=('extra-cmake-modules')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")
sha512sums=('00cf3b94bd0a5971c146b015caafb26617871bf8f87d8600eb027c66c3aea71a7c2bc54dc73e80cacd51dd502277164873efe87a97ded89d95428e9c463e2903')

build() {
  cd ${pkgname}-${pkgver}

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib .
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}"
}
