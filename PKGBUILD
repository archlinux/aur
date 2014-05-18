# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-unikey
pkgver=0.2.4
pkgrel=1
pkgdesc="Fcitx Wrapper for unikey"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx')
optdepends=('qt4: To run the fcitx unikey macro editor')
makedepends=('cmake' 'qt4')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz")
install=fcitx-unikey.install

build() {
  cd ${pkgname}-${pkgver}

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DQT_QMAKE_EXECUTABLE=qmake-qt4 .
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

sha512sums=('d55fe71bbcbc420e0ba3ec61ad3c7e9293e33f30b6303d90591d5a94e89d7bbc513dc940ae5a081b81c0d973fa6674872a695eac03cfbbefb460609993219221')
