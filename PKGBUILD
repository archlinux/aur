# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=rest
pkgver=0.7.11
pkgrel=1
pkgdesc="A helper library for RESTful services."
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('GPL2')
depends=('glib2' 'libxml2' 'libsoup-gnome')
makedepends=('gobject-introspection')
options=('!libtool')
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-${pkgver}.tar.xz)
sha256sums=('3a57a56433761c87ccdbfe6d57119361dc004286356c12815dc7a22b7b315490')

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
