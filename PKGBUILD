# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=libchamplain
pkgver=0.6.1
pkgrel=1
pkgdesc="C library aimed to provide a Gtk+ widget to display rasterized maps"
url="http://projects.gnome.org/libchamplain/"
license=('LGPL')
arch=('i686' 'x86_64')
replaces=('libchamplain-gtk')
options=('!libtool')
depends=('clutter-gtk>=0.10.2' 'libsoup' 'cairo>=1.4' 'sqlite3')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/0.6/${pkgname}-${pkgver}.tar.bz2)
md5sums=('19713d18393d5d2563f8dc5cef98c847')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --disable-static
	make || return 1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install || return 1
} 
