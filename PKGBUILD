# Maintainer: Gary Hunt <garysERASE_THIS_PARTboxATgmailonedotcom>

pkgname=tinyfugue4-stable
pkgver=4.0s1
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="flexible, screen-oriented MUD client, for use with any type of MUD"
url="http://tinyfugue.sourceforge.net/"
license=("GPL")
depends=(pcre zlib ncurses openssl)
source=("git+https://github.com/gary9872/tf40s1.git")
sha256sums=('SKIP')

# build function
build() {
	
	cd $srcdir/tf40s1
	sh unixmake files

}

# package function, cleanup
package() {
	
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/man/man6/
	cd $srcdir/tf40s1
	cp tf-lib $pkgdir/usr/share/ -R
	cp src/tf $pkgdir/usr/bin/
	cp src/tf.1.nroffman $pkgdir/usr/share/man/man6/tf.6.gz
}
