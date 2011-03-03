# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=libchamplain
pkgver=0.9.0
pkgrel=1
pkgdesc="Gtk3 widget for displaying rasterized maps"
url="http://projects.gnome.org/libchamplain/"
license=('LGPL')
arch=('i686' 'x86_64')
options=('!libtool')
depends=('clutter-gtk' 'libsoup-gnome' 'cairo' 'sqlite3')
makedepends=('gobject-introspection' 'gtk-doc')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('8671f43faebd1ca2c5ad556eb78f43c360f8ad4994c784118d2bc26a317849f4')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --disable-static --disable-debug
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}
