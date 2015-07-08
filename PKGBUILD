# $Id: PKGBUILD 99844 2013-10-31 02:02:46Z allan $
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=libgnome-media-profiles
pkgver=3.0.0
pkgrel=4
pkgdesc="Library for management of audio recording profiles"
arch=('i686' 'x86_64')
url="https://git.gnome.org/browse/libgnome-media-profiles"
license=('GPL2')
depends=('gconf' 'gtk3' 'gstreamer0.10-base-plugins')
makedepends=('intltool' 'gnome-doc-utils')
install=$pkgname.install
source=(http://download.gnome.org/sources/${pkgname}/3.0/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('ab1288e53a8fccca3e8fa59757ef586901e236e09a737a1178eeb8d74428c061')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc \
              --disable-static --disable-schemas-install \
              --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
