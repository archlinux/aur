# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=libchamplain
pkgver=0.8.1
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
md5sums=('4490dca0c099cac47ed93796d5bd79fd')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --disable-static
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}
