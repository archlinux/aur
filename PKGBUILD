# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=swig
pkgver=1.3.38
pkgrel=1
pkgdesc="SWIG is a compiler that makes it easy to integrate C and C++ code with scripting languages"
arch=('i686' 'x86_64')
license=('custom')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
url="http://www.swig.org/"
depends=('guile' 'gcc-libs' 'zlib')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install
	install -D -m644 LICENSE ${startdir}/pkg/usr/share/licenses/swig/license.txt
}
md5sums=('650c774917be49c526a4f8a3e733c898')
