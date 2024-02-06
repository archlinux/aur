# Maintainer: rafaelff <rafaelff@gnome.org>

pkgname=classified-ads
pkgver=0.16
pkgrel=1
pkgdesc="A distributed, server-less messaging system"
arch=('x86_64')
url="http://katiska.org/classified_ads/"
license=('LGPL-2.1-or-later')
depends=(qt5-multimedia miniupnpc tk libnatpmp)
makedepends=(imagemagick)
source=("https://github.com/operatornormal/$pkgname/archive/$pkgver.tar.gz#/$pkgname-$pkgver.tar.gz")
sha256sums=('01a0a5cf470297147303c86b2b9f5c1a8eb5c6b183ee496373919b6790fc1592')

build() {
  cd $pkgname-$pkgver
  make -C graphics-highres
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir" DESTDIR="$pkgdir" install
}
