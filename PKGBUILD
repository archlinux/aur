# Maintainer: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader
pkgver=2.25
pkgrel=1
pkgdesc="An open source downloader for GOG.com games, uses the GOG.com API"
url="https://sites.google.com/site/gogdownloader/"
arch=(i686 x86_64)
license=(WTFPL)
depends=('boost' 'jsoncpp' 'liboauth' 'rhash' 'tinyxml' 'htmlcxx' 'curl')
makedepends=('help2man')
source=(http://sites.google.com/site/gogdownloader/$pkgname-$pkgver.tar.gz)
sha256sums=('e9310b4e54a88d69f88346afaf647d057a2622ac5ee4b1309197bb5a0eba5af3')

build() {
	cd $srcdir/$pkgname-$pkgver

	# Set to debug for more output
	make release

}

package() {
	cd $srcdir/$pkgname-$pkgver
	
	make PREFIX=$pkgdir/usr install
}


