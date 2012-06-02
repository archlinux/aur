# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=clutter-gst
pkgver=1.5.6
pkgrel=1
pkgdesc="GStreamer bindings for clutter"
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('LGPL')
depends=('clutter' 'gstreamer0.10-base' 'libxdamage')
makedepends=('gobject-introspection')
options=('!libtool')
source=(http://clutter-project.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('f12b59d5a548abe38c63750ae2e6cb909afd90cfdcc06d2c4288097f962b08bc')

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
