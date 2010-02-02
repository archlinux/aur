# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=libchamplain
pkgver=0.4.4
pkgrel=1
pkgdesc="C library aimed to provide a Gtk+ widget to display rasterized maps"
url="http://projects.gnome.org/libchamplain/"
license=('LGPL')
arch=('i686' 'x86_64')
replaces=('libchamplain-gtk')
options=('!libtool')
depends=('clutter-gtk>=0.10.2' 'libsoup' 'cairo>=1.4' 'sqlite3')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/0.4/${pkgname}-${pkgver}.tar.bz2)
md5sums=('0a7897ee27d33471cec417132a1522d6')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --disable-static
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
} 
