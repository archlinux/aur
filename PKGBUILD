# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=clutter-gst
pkgver=1.9.92
pkgrel=1
pkgdesc="GStreamer bindings for clutter"
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('LGPL')
depends=('clutter' 'gst-plugins-base-libs' 'libxdamage')
makedepends=('gobject-introspection')
options=('!libtool')
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('5c09dce218f711a44bd4d741e2dd10ffc47e7fcd7b0cf514ca0e92b825c76c45')

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
