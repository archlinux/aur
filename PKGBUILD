# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=glib-networking
pkgver=2.31.20
pkgrel=1
pkgdesc="Network-related giomodules for glib"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('GPL2')
depends=('glib2' 'libproxy' 'gnutls' 'libgcrypt' 'ca-certificates' 'gsettings-desktop-schemas')
makedepends=('intltool')
options=('!libtool')
install=glib-networking.install
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('82015c3601840b733d3f79298b49cce3708c064c3139975d56a44017cf162b5f')

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
