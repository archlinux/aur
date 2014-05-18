# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-chewing
pkgver=0.2.2
pkgrel=1
pkgdesc='Fcitx Wrapper for chewing'
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-chewing"
license=('GPL')
depends=('libchewing' 'fcitx')
makedepends=('cmake')
source=("http://download.fcitx-im.org/fcitx-chewing/$pkgname-$pkgver.tar.xz")

build() {
  cd ${pkgname}-${pkgver}

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}

md5sums=('5f24cffc068043251671f9e385d4a6cd')
