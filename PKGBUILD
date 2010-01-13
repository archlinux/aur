# Contributor: Michael Kanis <mkanis@gmx.de>
pkgname=libchamplain
pkgver=0.4.2
pkgrel=1
pkgdesc="C library aimed to provide a Gtk+ widget to display rasterized maps"
url="http://projects.gnome.org/libchamplain/"
license=('LGPL')
arch=('i686' 'x86_64')
replaces=('libchamplain-gtk')
depends=('clutter-gtk>=0.10.0' 'libsoup' 'cairo>=1.4' 'sqlite3')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/0.4/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('2b1f8fc49e306a3a6da3ef3fea8630c76cecdffbfa53c251e7e15af8f4b8d77f')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --disable-introspection || return 1
	make || return 1
	make DESTDIR=$startdir/pkg install
} 
