# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=table
pkgver=0.7.1
pkgrel=2
pkgdesc="Command line utility to format and display CSV"
arch=('x86_64')
url="https://strahinja.srht.site/table"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/table/archive/v$pkgver.tar.gz")
md5sums=('884b5dc9b418b0477a6183f334b50337')

build() {
	cd $pkgname-v$pkgver
	
	# Some build environments insist on having those preset, which breaks
	# the build; if you really want some of them, comment the 'unset' lines
	# below, but note you are on your own wrt errors.
	unset BINDIR CC CFLAGS CPPFLAGS DOCDIR HEADERS INSTALL LDFLAGS LIBS
	unset MANPAGE MANPREFIX OBJS PROG SRC 

	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" make -e all
}

package() {
	cd $pkgname-v$pkgver

	unset BINDIR CC CFLAGS CPPFLAGS DOCDIR HEADERS INSTALL LDFLAGS LIBS
	unset MANPAGE MANPREFIX OBJS PROG SRC 

	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" make -e install
}
