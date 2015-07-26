# Maintainer: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader
pkgver=2.24
pkgrel=1
pkgdesc="An open source downloader for GOG.com games, uses the GOG.com API"
url="https://sites.google.com/site/gogdownloader/"
arch=(i686 x86_64)
license=(WTFPL)
depends=('boost' 'jsoncpp' 'liboauth' 'rhash' 'tinyxml' 'htmlcxx' 'curl')
makedepends=('help2man')
source=(http://sites.google.com/site/gogdownloader/$pkgname-$pkgver.tar.gz)
sha256sums=('3266db0fbe078a642600e63fb53437c1fc43389a33f1a223e27478ed6bf32c5b')

build() {
	cd $srcdir/$pkgname-$pkgver

	# Set to debug for more output
	make release

}

package() {
	cd $srcdir/$pkgname-$pkgver
	
	make PREFIX=$pkgdir/usr install
}


