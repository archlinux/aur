# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=swig
pkgver=1.3.36
pkgrel=1
pkgdesc="SWIG is a compiler that makes it easy to integrate C and C++ code with scripting languages"
arch=('i686' 'x86_64')
license=('custom')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
url="http://www.swig.org/"
depends=('gcc' 'guile')

md5sums=('8f30aa4130b62404099bbcba1bf429b1')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install
	install -D -m644 LICENSE ${startdir}/pkg/usr/share/licenses/swig/license.txt
}
