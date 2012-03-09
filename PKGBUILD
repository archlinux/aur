# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgdata
pkgver=0.11.0
pkgrel=1
pkgdesc="GLib-based library for accessing online service APIs using the GData protocol"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libsoup-gnome' 'liboauth')
makedepends=('intltool' 'gobject-introspection')
url="http://www.gnome.org"
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('819a077fab77cca9408409bf86da5b028699972c2c9bbf96e41755f801acea6b')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
