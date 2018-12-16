# Maintainer: Sandor Nagy <sandor[dot]nagy[at]kdemail[dot]net>
pkgname=librcsc
pkgver=4.1.0
pkgrel=1
pkgdesc="The basic library to develop the RoboCup Soccer Simulation client and tools"
arch=('x86_64' 'i686')
url="https://osdn.net/projects/rctools/"
license=('CCPL')
groups=('rcss')
depends=('zlib' 'gcc-libs' 'sh')
makedepends=('boost>=1.32')
optdepends=(
	'rcssserver:	RCSS Server'
	'rcssmonitor:	RCSS Monitor'
	'cppunit:	C++ unit testing framework')
options=('buildflags' 'makeflags')
source=(https://osdn.net/dl/rctools/$pkgname-$pkgver.tar.gz)
md5sums=('509c30d1e00499a08ae1f58f4ff05573')

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
