# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-unikey
pkgver=0.2.5
pkgrel=3
pkgdesc="Fcitx Wrapper for unikey"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx')
optdepends=('fcitx-qt4: To run the fcitx unikey macro editor')
makedepends=('cmake' 'fcitx-qt4')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz")
sha512sums=('b70cbc468c44677a6f831ab92539dc01386eec66d8b40eba57efc7130a3811548b5b1e8213c278fd26d1eac169d43913a5fe0f3728e925c874e7360ccd93636a')

build() {
  cd ${pkgname}-${pkgver}

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DQT_QMAKE_EXECUTABLE=qmake-qt4 .
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
