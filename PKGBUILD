# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
pkgname=clutter-gst
pkgver=1.3.8
pkgrel=1
pkgdesc="GStreamer bindings for clutter"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('GPL2')
depends=('clutter' 'gstreamer0.10-base')
makedepends=('gobject-introspection' 'gtk-doc')
options=('!libtool')
source=(http://clutter-project.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('376c069bed2a6b374d96615b7196cb5f6ee4bbbd94243f92b64dee3ec56aec28')

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
