# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan
pkgver=0.153
pkgrel=1
pkgdesc='A powerful Newsgroup Article reader'
arch=(x86_64)
url='http://pan.rebelbase.com/'
license=(GPL2)
depends=(gtkspell3 gmime3)
makedepends=(itstool)
source=(https://gitlab.gnome.org/GNOME/pan/-/archive/v$pkgver/pan-v$pkgver.tar.gz)
sha256sums=('0f71e5518a3cb6b29f470134dd86c68a4fda7bbccfcc98856c0301f7f4a6ddaf')

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
