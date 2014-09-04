# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=rest
pkgver=0.7.92
pkgrel=1
pkgdesc="A helper library for RESTful services."
arch=(i686 x86_64)
url="http://www.gtk.org/"
license=(GPL2)
depends=(glib2 libxml2 'libsoup')
makedepends=(gobject-introspection python2)
source=(http://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-${pkgver}.tar.xz)
sha256sums=('07548c8785a3e743daf54a82b952ff5f32af94fee68997df4c83b00d52f9c0ec')

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
