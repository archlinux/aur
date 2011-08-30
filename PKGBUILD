# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
pkgname=glib-networking
pkgver=2.29.18
pkgrel=1
pkgdesc="Network-related giomodules for glib"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('GPL2')
depends=('glib2' 'libproxy' 'gnutls' 'libgcrypt' 'ca-certificates' 'gsettings-desktop-schemas')
makedepends=('intltool' 'namcap')
options=('!libtool')
install=glib-networking.install
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-${pkgver}.tar.xz)
sha256sums=('87d77d9bf184398cd8b7f709e6de42f11b2badf9df1bd96a9ab69c0c8a0766f0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib/glib-networking --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
