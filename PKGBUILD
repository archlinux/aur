# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=glib-networking
pkgver=2.29.92
pkgrel=1
pkgdesc="Network-related giomodules for glib"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('GPL2')
depends=('glib2' 'libproxy' 'gnutls' 'libgcrypt' 'ca-certificates' 'gsettings-desktop-schemas')
makedepends=('intltool')
options=('!libtool')
install=glib-networking.install
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-${pkgver}.tar.xz)
sha256sums=('65b3785e02ffae1cf5e3f25985ac428d6d17e69355947ed831e1a6d1e852948a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib/glib-networking --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
