# Maintainer: Julian Sparber <julian@sparber.net>
pkgname=mx5500-set
pkgver=0.2
pkgrel=1
pkgdesc="Control your Logitech MX 5500 keyboard over hidraw."
arch=('i686' 'x86_64')
url="https://github.com/jsparber/mx5500-set"
license=('GPL')
makedepends=('git')

_gitroot="git@github.com:jsparber/mx5500-set.git"
_gitname="mx5500-set"

build() {
	cd ${srcdir}
	rm -Rf *
	msg "Connecting to GIT server ..."
	git clone $_gitroot
	cd $_gitname
	make -f Makefile
}


package() {
	cd $srcdir/$_gitname
	mkdir -p $pkgdir/usr/bin
	install -m a+rx mx5500 $pkgdir/usr/bin/
}
