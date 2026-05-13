# Maintainer: Elmer Skjødt Henriksen <esh@fjerhammer.dk>
# Contributor: Kristian Gunstone <kristian.gunstone.without.this.stuff@pean.org.also.this>
# Contributor: Bruno Victal <ubr47k at gmail dot com>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: hornetsnest0@gmail.com

pkgname=mikmod
pkgver=3.2.9
pkgrel=1
pkgdesc="A curses module player based on libmikmod"
url="http://mikmod.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmikmod' 'ncurses')
source=("http://downloads.sourceforge.net/project/mikmod/mikmod/${pkgver}/mikmod-${pkgver}.tar.gz")
sha256sums=('214c10aa3019807a1eb26b2c709592f63dbcc00b72985aa86a4fb7ac3cd8b901')

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
