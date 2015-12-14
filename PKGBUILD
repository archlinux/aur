# Maintainer: Bruno Victal <ubr47k at gmail dot com>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: hornetsnest0@gmail.com

pkgname=mikmod
pkgver=3.2.7
pkgrel=1
pkgdesc="A curses module player based on libmikmod"
url="http://mikmod.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmikmod' 'ncurses')
source=("http://downloads.sourceforge.net/project/mikmod/mikmod/${pkgver}/mikmod-${pkgver}.tar.gz")
sha256sums=('5f398d5a5ccee2ce331036514857ac7e13a5644267a13fb11f5a7209cf709264')

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
