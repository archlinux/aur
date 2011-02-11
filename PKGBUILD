# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
pkgname=clutter-gst
pkgver=1.0.0
pkgrel=1
pkgdesc="GStreamer bindings for clutter"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('GPL2')
depends=('clutter' 'gstreamer0.10-base')
makedepends=('gobject-introspection' 'gtk-doc')
options=('!libtool')
source=(http://clutter-project.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('ae6ec048b570157130e9f9069f2495caf0da9eefa8d7f3b1789f3346fb16f696')

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
