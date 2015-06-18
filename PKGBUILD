# Maintainer: Michael von Domaros <mvondomaros at gmail dot com>
pkgname=travis
pkgver=150205
pkgrel=1
pkgdesc="Trajectory Analyzer and Visualizer"
arch=('i686' 'x86_64')
url="http://www.travis-analyzer.de"
license=('GPL3')
depends=('gcc-libs')
options=('!strip')
source=($url/files/$pkgname-src-$pkgver.tar.gz)
md5sums=('14cbd0d3b722c12f75c4b3cffabe37a8')

build() {
	cd "$srcdir/$pkgname-src-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-src-$pkgver"
	install -Dm 755 exe/travis $pkgdir/usr/bin/travis
}
