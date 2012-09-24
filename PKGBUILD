# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=clutter-gst
pkgver=1.9.90
pkgrel=1
pkgdesc="GStreamer bindings for clutter"
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('LGPL')
depends=('clutter' 'gst-plugins-base-libs' 'libxdamage')
makedepends=('gobject-introspection')
options=('!libtool')
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('4b05f2d282baf308e6f2e480da5fe05d0755569778caf4c320a2d47cfc682a2d')

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
