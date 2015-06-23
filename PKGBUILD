# Maintainer: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader
pkgver=2.23
pkgrel=1
pkgdesc="An open source downloader for GOG.com games, uses the GOG.com API"
url="https://sites.google.com/site/gogdownloader/"
arch=(i686 x86_64)
license=(WTFPL)
depends=('boost' 'jsoncpp' 'liboauth' 'rhash' 'tinyxml' 'htmlcxx' 'curl')
makedepends=('help2man')
source=(http://sites.google.com/site/gogdownloader/$pkgname-$pkgver.tar.gz)
sha256sums=('e04bfa506e5ba5b5d98255babfd9fbadf4c53af6198aace7ac33a7ed44083c66')

build() {
	cd $srcdir/$pkgname-$pkgver

	# Set to debug for more output
	make release

}

package() {
	cd $srcdir/$pkgname-$pkgver
	
	make PREFIX=$pkgdir/usr install
}


