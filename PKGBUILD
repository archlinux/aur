# Maintainer: Sandor Nagy <sandor[dot]nagy[at]kdemail[dot]net>
# Contributor: Ivan Reche <ivan.reche[at]gmail[dot]com>
# Contributor: Masoud Naservand <relive[dot]mn[at]gmail[dot]com>
pkgname=rcssmonitor
pkgver=18.0.0
pkgrel=1
pkgdesc="The RoboCup Soccer Simulator Monitor"
arch=('x86_64')
url="https://github.com/rcsoccersim/rcssmonitor"
license=('GPL-3-or-later')
groups=('rcss')
depends=('qt5-base' 'fontconfig' 'libxt' 'glib2' 'libxi' 'libxrender')
optdepends=(
	'rcssserver:	RCSS Server'
	'soccerwindow2:	extra RCSS viewer')
options=('buildflags' 'makeflags')
source=(https://github.com/rcsoccersim/rcssmonitor/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('e8a40f83e4dcbaea04fc559955ca9f95')

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
