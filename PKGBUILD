# Maintainer: Sandor Nagy <sandor[dot]nagy[at]kdemail[dot]net>
# Contributor: Ivan Reche <ivan.reche[at]gmail[dot]com>
# Contributor: Masoud Naservand <relive[dot]mn[at]gmail[dot]com>
pkgname=rcssmonitor
pkgver=15.2.1
pkgrel=1
pkgdesc="The RoboCup 2D Soccer Simulator Monitor."
arch=('i686' 'x86_64')
url="https://github.com/rcsoccersim/rcssmonitor"
license=('GPL')
groups=('rcss')
depends=('qt4' 'boost-libs>=1.32')
makedepends=('boost>=1.32' 'gcc-libs')
optdepends=(
	'rcssserver:	RCSS Server'
	'soccerwindow2:	extra RCSS viewer')
options=('buildflags' 'makeflags')
source=(https://github.com/rcsoccersim/rcssmonitor/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('6f7dc277d19c98ef9b9ef19808c8ca92')

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
