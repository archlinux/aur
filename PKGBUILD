# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-unikey
pkgver=0.2.6
pkgrel=1
pkgdesc="Fcitx Wrapper for unikey"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx')
optdepends=('fcitx-qt4: To run the fcitx unikey macro editor')
makedepends=('cmake' 'fcitx-qt4')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz")
sha512sums=('18efb387387c29bb059e1260bfb3c91e97f9989aedbe590596f1ad8659e9fad20777f048f20fb24e0fb5e2318eee1c25fc20a2d57ac846368c4c9bebf4eb2b90')

build() {
  cd ${pkgname}-${pkgver}

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DQT_QMAKE_EXECUTABLE=qmake-qt4 .
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
