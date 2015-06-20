# Maintainer: Sándor Nagy <sanya868[at]gmail[dot]com>
pkgname=librcsc
pkgver=4.1.0
pkgrel=1
pkgdesc="The basic library to develop the RoboCup Soccer Simulation client and tools"
arch=('x86_64' 'i686')
url="http://rctools.sourceforge.jp/"
license=('CCPL')
groups=('rcss')
depends=('zlib' 'gcc-libs' 'sh')
makedepends=('boost>=1.32')
optdepends=(
	'rcssserver:	RCSS Server'
	'rcssmonitor:	RCSS Monitor'
	'cppunit:	C++ unit testing framework')
options=('buildflags' 'makeflags')
source=(http://jaist.dl.sourceforge.jp/rctools/51941/$pkgname-$pkgver.tar.gz)
sha512sums=('8609aa8d3a1d8ccfe49af8497e696cff20d3587670282f9e0c5440dfa35fcc2a02ea098373f9da22d1c1aab3331637af164af7cd9855a1b536cfede2d63aaa1d')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
