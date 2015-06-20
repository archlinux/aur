# Contributor: Ivan Reche <ivan.reche[at]gmail[dot]com>
# Contributor: Masoud Naservand <relive[dot]mn[at]gmail[dot]com>
# Maintainer: Sándor Nagy <sanya868[at]gmail[dot]com>
pkgname=rcssmonitor
pkgver=15.1.1
pkgrel=1
pkgdesc="The RoboCup 2D Soccer Simulator Monitor."
arch=('i686' 'x86_64')
url="https://sourceforge.net/apps/mediawiki/sserver/index.php?title=Main_Page"
license=('GPL')
groups=('rcss')
depends=('qt4' 'boost-libs>=1.32')
makedepends=('boost>=1.32' 'gcc-libs')
optdepends=(
	'rcssserver:	RCSS Server'
	'soccerwindow2:	extra RCSS viewer')
options=('buildflags' 'makeflags')
source=(http://downloads.sourceforge.net/sourceforge/sserver/$pkgname-$pkgver.tar.gz)
sha512sums=('3b1b0aa7bfe1001355f70b13ef03ea59e0ce65fe3de061717bb0813de1007c318847499d2ddb2d768a0f3877aca505a9ffa1e0156fa6842c142b0edf5419f83d')

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
