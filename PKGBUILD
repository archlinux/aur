# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-qt5
pkgver=0.1.2
pkgrel=1
pkgdesc="Qt5 IM Module for Fcitx"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx' 'qt5-base')
makedepends=('cmake')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")

build() {
  cd ${pkgname}-${pkgver}

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib .
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}"
}

sha512sums=('e1e9ca1eab6515dab33be3632136d2f4bb1779b5995f19f8767bdb3422074e1e73d7ff412838f490164ebb4db1d84db28e16e39cdd67d115da244709480c4048')
