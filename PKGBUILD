# Maintainer: Toolybird <toolybird at tuta dot io>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan
pkgver=0.157
pkgrel=1
pkgdesc='A powerful Newsgroup Article reader'
arch=(x86_64)
url='http://pan.rebelbase.com/'
license=(GPL-2.0-or-later)
depends=(
  cairo
  enchant
  gcc-libs
  gdk-pixbuf2
  glib2
  gmime3
  gnutls
  gtk3
  gtkspell3
  hicolor-icon-theme
  pango
  zlib
)
source=("https://gitlab.gnome.org/GNOME/pan/-/archive/v$pkgver/pan-v$pkgver.tar.gz")
sha256sums=('ea9093642dc3675a5868d67ea97aedce38beeb2c3281c84fb044fc802bbaa620')

prepare() {
  cd pan-v$pkgver
  NOCONFIGURE=1 ./autogen.sh
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
