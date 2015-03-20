# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=rest
pkgver=0.7.93
pkgrel=1
pkgdesc="A helper library for RESTful services."
arch=(i686 x86_64)
url="http://www.gtk.org/"
license=(GPL2)
depends=(glib2 libxml2 'libsoup')
makedepends=(gobject-introspection)
source=(http://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-${pkgver}.tar.xz)
sha256sums=('c710644455340a44ddc005c645c466f05c0d779993138ea21a62c6082108b216')

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
