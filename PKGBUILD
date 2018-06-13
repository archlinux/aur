# Maintainer: Michael von Domaros <mvondomaros at gmail dot com>
pkgname=travis
pkgver=180604
pkgrel=1
pkgdesc="Trajectory Analyzer and Visualizer"
arch=('i686' 'x86_64')
url="http://www.travis-analyzer.de"
license=('GPL3')
depends=('gcc-libs')
options=('!strip')
source=($url/files/$pkgname-src-$pkgver.tar.gz)
md5sums=('44b3bfc36d40707a991ab6ebfc7ce84c')

build() {
	cd "$srcdir/$pkgname-src-$pkgver"
	make CFLAGS="$CFLAGS -ansi"
}

package() {
	cd "$srcdir/$pkgname-src-$pkgver"
	install -Dm 755 exe/travis $pkgdir/usr/bin/travis
}
