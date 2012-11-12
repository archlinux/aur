# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=glib-networking
pkgver=2.34.2
pkgrel=1
pkgdesc="Network-related giomodules for glib"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('GPL2')
depends=('glib2' 'libproxy' 'gnutls' 'ca-certificates' 'gsettings-desktop-schemas')
makedepends=('intltool')
options=('!libtool')
install=glib-networking.install
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('00a92ec7b31f03a2fc1eeff568c0f1664e109b3add8c7042d2d420953f49dfde')

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib/glib-networking --disable-static
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
