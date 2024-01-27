# Maintainer:
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan
pkgver=0.155
pkgrel=1
pkgdesc='A powerful Newsgroup Article reader'
arch=(x86_64)
url='http://pan.rebelbase.com/'
license=(GPL2)
depends=(gtkspell3 gmime3)
makedepends=(itstool)
source=(https://gitlab.gnome.org/GNOME/pan/-/archive/v$pkgver/pan-v$pkgver.tar.gz)
sha256sums=('49acd5e18e323e16f53438ac7721cf0fb2d8c1c78846e69c8985dd3640187670')

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
