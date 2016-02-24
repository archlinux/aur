# Maintainer: Michael von Domaros <mvondomaros at gmail dot com>
pkgname=travis
pkgver=160223
pkgrel=1
pkgdesc="Trajectory Analyzer and Visualizer"
arch=('i686' 'x86_64')
url="http://www.travis-analyzer.de"
license=('GPL3')
depends=('gcc-libs')
options=('!strip')
source=($url/files/$pkgname-src-$pkgver.tar.gz)
md5sums=('e961acbe5e18fd3d21fe2f0305f2af9e')

build() {
	cd "$srcdir/$pkgname-src-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-src-$pkgver"
	install -Dm 755 exe/travis $pkgdir/usr/bin/travis
}
