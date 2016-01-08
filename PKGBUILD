# Maintainer: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader
pkgver=2.26
pkgrel=2
pkgdesc="An open source downloader for GOG.com games, uses the GOG.com API"
url="https://sites.google.com/site/gogdownloader/"
arch=(i686 x86_64)
license=(WTFPL)
depends=('boost' 'jsoncpp' 'liboauth' 'rhash' 'tinyxml' 'htmlcxx' 'curl')
makedepends=('help2man')
source=(http://sites.google.com/site/gogdownloader/$pkgname-$pkgver.tar.gz)
sha256sums=('bedcab047a49c0bbe8dbd0dfbfa8bf1b718a0578df5aed4eee96e85f0f616a09')

build() {
	cd $srcdir/$pkgname-$pkgver

	# Set to debug for more output
	make release

}

package() {
	cd $srcdir/$pkgname-$pkgver
	
	make PREFIX=$pkgdir/usr install
}


