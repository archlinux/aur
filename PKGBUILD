# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-unikey
pkgver=0.2.3
pkgrel=1
pkgdesc="Fcitx Wrapper for unikey"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx>=4.2.8')
optdepends=('qt4: To run the fcitx unikey macro editor')
makedepends=('cmake' 'qt4')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz")
install=fcitx-unikey.install

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DQT_QMAKE_EXECUTABLE=qmake-qt4 ..
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}

sha512sums=('5826022312ad307d8a070cd3ab77a206a5f73d6ce5337cdac4c75ec9a436b055ca0e28fcc7baf2f1512b2cb92c779002a8fc41ac01cdedc3dc669355d825a0aa')
