# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=libchamplain
pkgver=0.10.0
pkgrel=1
pkgdesc="Gtk3 widget for displaying rasterized maps"
url="http://projects.gnome.org/libchamplain/"
license=('LGPL')
arch=('i686' 'x86_64')
options=('!libtool')
depends=('clutter-gtk' 'libsoup-gnome' 'cairo' 'sqlite3')
makedepends=('gobject-introspection' 'gtk-doc')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('98700bb3f3ada5f9bd6b938486e55f90ea76ce4108a8b62928cf185ded49dbb1')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --disable-static --disable-debug
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}
