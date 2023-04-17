# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan
pkgver=0.154
pkgrel=1
pkgdesc='A powerful Newsgroup Article reader'
arch=(x86_64)
url='http://pan.rebelbase.com/'
license=(GPL2)
depends=(gtkspell3 gmime3)
makedepends=(itstool)
source=(https://gitlab.gnome.org/GNOME/pan/-/archive/v$pkgver/pan-v$pkgver.tar.gz)
sha256sums=('f82e925291883b794e2ab4a829115ce73357b6db45bcfb5e0059a5ce32c57571')

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
