pkgname=terrafirma
pkgver=3.1.8
pkgrel=2
pkgdesc='Mapping for Terraria'
arch=('any')
url='http://seancode.com/terrafirma'
license=(BSD)
depends=(qt5-base)
makedepends=(qt5-tools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mrkite/TerraFirma/archive/$pkgver.tar.gz")
sha256sums=('93491dfabb5fb19727c71a306b2617c109291a7d10e953f98c55331c70a8622a')

build() {
	cd "$srcdir/TerraFirma-$pkgver"
	qmake CONFIG+=optimize_full
	make
}

package() {
	cd "$srcdir/TerraFirma-$pkgver"
	INSTALL_ROOT="$pkgdir" make install
}
