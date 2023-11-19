# Maintainer: Gary Hunt <garysERASE_THIS_PARTboxATgmailonedotcom>

pkgname=tinyfugue-rebirth
pkgver=5.1.5
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="flexible, screen-oriented MUD client, with python,lua,atcp,gmcp and option102 support"
url="http://https://github.com/ingwarsw/tinyfugue"
license=("GPL")
depends=(pcre zlib ncurses openssl lua51 python)
source=("https://github.com/ingwarsw/tinyfugue/archive/refs/tags/5.1.5.tar.gz")

# build function
build() {
	
	cd $srcdir/tinyfugue-$pkgver
	./configure --enable-atcp --enable-gmcp --enable-option102 --enable-python --enable-termcap=ncurses --enable-lua --bindir=/usr/bin/ --datarootdir=/usr/share 
	make -j4
}

# package function, cleanup
package() {
	
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/doc/tinyfuge-rebirth
	mkdir -p $pkgdir/usr/share/tf-lib/
	cd $srcdir/tinyfugue-$pkgver
	cp src/tf $pkgdir/usr/bin/
	cd lib/
	cp tf/*.* $pkgdir/usr/share/tf-lib/
	cp lua/*.* $pkgdir/usr/share/tf-lib/
	cp py/*.* $pkgdir/usr/share/tf-lib/
}
sha256sums=('85b342925675e39e17cf95e8a65d69a3927657e066efd52c301a20e6d36c2f98')
