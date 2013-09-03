# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-table-other
pkgver=0.2.2
pkgrel=1
pkgdesc='Provides some other tables for Fcitx, fork from ibus-table-others, scim-tables.'
arch=('any')
url="http://code.google.com/p/fcitx/"
license=('GPL2')
depends=('fcitx')
makedepends=('cmake' 'intltool')
install=$pkgname.install
source=("http://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

md5sums=('b2827e5ddb962cdbdb2ede59d3c5752f')
