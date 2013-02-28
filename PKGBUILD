# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=clutter-gst
pkgver=2.0.2
pkgrel=1
pkgdesc="GStreamer bindings for clutter"
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('LGPL')
depends=('clutter' 'gst-plugins-base-libs' 'libxdamage')
makedepends=('gobject-introspection')
options=('!libtool')
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('577957598d6ee407348dc5d78879da2b212ae54fb3071f86f8409e393dde34c4')

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
