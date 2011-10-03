# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
pkgname=clutter-gst
pkgver=1.4.2
pkgrel=1
pkgdesc="GStreamer bindings for clutter"
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('LGPL')
depends=('clutter' 'gstreamer0.10-base' 'libxdamage')
makedepends=('gobject-introspection' 'gtk-doc')
options=('!libtool')
source=(http://clutter-project.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('48f623a08a6793ab688ef6b899a2d889ef68053718ba44aac7997a1f9f619e7e')

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
