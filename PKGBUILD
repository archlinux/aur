# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
pkgname=glib-networking
pkgver=2.28.5
pkgrel=1
pkgdesc="Network-related giomodules for glib"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('GPL2')
depends=('glib2' 'libproxy' 'gnutls' 'ca-certificates')
makedepends=('intltool')
options=('!libtool')
install=glib-networking.install
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-${pkgver}.tar.bz2)
sha256sums=('959ffeb91fee17c1b0fb2aa82872c3daae0230de93708b2ebabeb92b747d7876')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
