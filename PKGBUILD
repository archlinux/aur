# Maintainer: Hugo Hörnquist <hugo@lysator.liu.se>

pkgname=guile-shapefile
pkgdesc='Parse shapefiles (map data) in guile'
pkgver=0.1.2
pkgrel=1
arch=('any')
license=('MIT')
depends=('guile')
url="https://github.com/HugoNikanor/$pkgname"
source=("$url/archive/v$pkgver.tar.gz")
options=('!strip')
md5sums=('fb0cf028517ae3016ba91c1cd089d788')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make for-package
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR=$pkgdir install
}
