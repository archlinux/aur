# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
pkgname=glib-networking
pkgver=2.28.6.1
pkgrel=2
pkgdesc="Network-related giomodules for glib"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('GPL2')
depends=('glib2' 'libproxy' 'gnutls' 'ca-certificates' 'gsettings-desktop-schemas')
makedepends=('intltool')
options=('!libtool')
install=glib-networking.install
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*.*}/$pkgname-${pkgver}.tar.bz2)
sha256sums=('50f9aac36ce49b0e16f84a9f516cf59d0a1f9b3199634787fd9db7470ab6c65b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr  --sysconfdir=/etc \
    --libexecdir=/usr/lib/glib-networking --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
