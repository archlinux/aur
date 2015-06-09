# Maintainer: Bruno Victal <ubr47k at gmail dot com>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: hornetsnest0@gmail.com

pkgname=mikmod
pkgver=3.2.6
pkgrel=1
pkgdesc="A curses module player based on libmikmod"
url="http://mikmod.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmikmod' 'ncurses')
source=("http://downloads.sourceforge.net/project/mikmod/mikmod/${pkgver}/mikmod-${pkgver}.tar.gz")
sha256sums=('04544e0edb36a19fab61233dff97430969cff378a98f5989a1378320550e2673')

prepare() {
	mkdir build
}

build() {
	cd build
	../mikmod-${pkgver}/configure \
		--prefix=/usr \
		--mandir=/usr/share/man
	make
}

package() {
	cd build
	make DESTDIR=${pkgdir} install
}
