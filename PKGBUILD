# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan
pkgver=0.151
pkgrel=1
pkgdesc='A powerful Newsgroup Article reader'
arch=(x86_64)
url='http://pan.rebelbase.com/'
license=(GPL2)
depends=(gtkspell3 gmime3)
makedepends=(itstool)
source=(https://gitlab.gnome.org/GNOME/pan/-/archive/v$pkgver/pan-v$pkgver.tar.gz)
sha256sums=('f01e93a16f34334ab866ae8390864fb0d498f37f8df374acc2a5ca3c9ed6de29')

prepare() {
  cd pan-v$pkgver
  ./autogen.sh
}

build() {
  cd pan-v$pkgver
  ./configure --prefix=/usr --with-gnutls --with-gtkspell
  make
}

package() {
  cd pan-v$pkgver
  make DESTDIR="$pkgdir" install
}
