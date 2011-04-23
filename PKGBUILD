# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
pkgname=rest
pkgver=0.7.10
pkgrel=1
pkgdesc="rest"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('GPL2')
depends=('glib2' 'libxml2' 'libsoup-gnome')
makedepends=('gobject-introspection' 'gtk-doc')
options=('!libtool')
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-${pkgver}.tar.bz2)
sha256sums=('2908f974ae6cc71af1152d419209f307bcce8ca2dfe0b4b55b3fad8ba4a646a5')

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
