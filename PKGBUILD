# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=yash
pkgver=2.37
pkgrel=2
pkgdesc="Yet Another SHell is a POSIX-compliant command line shell"
arch=("i686" "x86_64")
license=("GPL2")
url="http://sourceforge.jp/projects/yash/"
#ToDo: Add propper deps
makedepends=("pax")
source=("${pkgname}-${pkgver}.tar.xz::http://iij.dl.sourceforge.jp/yash/62651/${pkgname}-${pkgver}.tar.xz")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr \
		libexecdir=/usr/lib/yash \
		sbindir=/usr/bin libdir=/usr/lib
 	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install DESTDIR=$pkgdir \
		prefix=/usr libexecdir=/usr/lib/yash \
		sbindir=/usr/bin libdir=/usr/lib
}

#Default to md5 as makepkg do, blame Allan McRae

md5sums=('c119e542d58d5555d36f237c0011e83d')
