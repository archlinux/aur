# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: lh <jason52lh@gmail.com>

pkgname=fcitx-rime
pkgver=0.3.0
pkgrel=2
pkgdesc='Fcitx Wrapper for librime'
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx' "librime" "brise")
makedepends=('cmake')
install=fcitx-rime.install
source=("http://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz")

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

sha512sums=('8dbb8fddf4d372d4af9707d2f1bbdb7c15eb29602ad5de8f0cec5dfca81074087fb2873980afd8cdd09f78316620b086708761d91b820b714539a5100bc156a8')
