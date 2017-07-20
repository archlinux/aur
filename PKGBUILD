# Maintainer: Kristian Gunstone <kristian.gunstone.without.this.stuff@pean.org.also.this>
# Contributor: Bruno Victal <ubr47k at gmail dot com>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: hornetsnest0@gmail.com

pkgname=mikmod
pkgver=3.2.8
pkgrel=1
pkgdesc="A curses module player based on libmikmod"
url="http://mikmod.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmikmod' 'ncurses')
source=("http://downloads.sourceforge.net/project/mikmod/mikmod/${pkgver}/mikmod-${pkgver}.tar.gz")
sha256sums=('dbb01bc36797ce25ffcab2b3bf625537b85b42534344e1808236ca612fbaa4cc')

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
