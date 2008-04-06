# $Id: PKGBUILD,v 1.15 2007/07/21 15:24:19 damir Exp $
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=swig
pkgver=1.3.31
pkgrel=1
pkgdesc="SWIG is a compiler that makes it easy to integrate C and C++ code with scripting languages"
arch=('i686' 'x86_64')
license=('custom')
source=("http://puzzle.dl.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
url="http://www.swig.org/"
depends=('gcc' 'guile')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install
	install -D -m644 LICENSE ${startdir}/pkg/usr/share/licenses/swig/license.txt
}
md5sums=('4a0bae63e3713e89b26db7209b6a7e05')
