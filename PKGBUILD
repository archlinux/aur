# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=libchamplain
pkgver=0.8.0
pkgrel=1
pkgdesc="C library aimed to provide a Gtk+ widget to display rasterized maps"
url="http://projects.gnome.org/libchamplain/"
license=('LGPL')
arch=('i686' 'x86_64')
replaces=('libchamplain-gtk')
options=('!libtool')
depends=('clutter-gtk>=0.10.8' 'libsoup' 'cairo>=1.8' 'sqlite3')
makedepends=('gobject-introspection')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/0.8/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('0784b53f488d690ed878b1bbf30cd9bd9b1baafb5b6b0d0b7b2ba0ef240c49cc')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --disable-static
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}
