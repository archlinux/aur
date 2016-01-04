# Maintainer: Michael von Domaros <mvondomaros at gmail dot com>
pkgname=travis
pkgver=160101
pkgrel=3
pkgdesc="Trajectory Analyzer and Visualizer"
arch=('i686' 'x86_64')
url="http://www.travis-analyzer.de"
license=('GPL3')
depends=('gcc-libs')
options=('!strip')
source=($url/files/$pkgname-src-$pkgver.tar.gz)
md5sums=('b5230e5463412007ae413846a6fea9fb')

build() {
	cd "$srcdir/$pkgname-src-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-src-$pkgver"
	install -Dm 755 exe/travis $pkgdir/usr/bin/travis
}
