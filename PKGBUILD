pkgname=terrafirma
pkgver=3.1.2
pkgrel=1
pkgdesc='Mapping for Terraria'
arch=('any')
url='http://seancode.com/terrafirma'
license=(BSD)
depends=()
makedepends=(qt5-base qt5-tools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mrkite/TerraFirma/archive/$pkgver.tar.gz")
sha256sums=('6118da3d0ca9e44381323ed7e94f015e0779770d7e2f86ec69062f4e9528f53f')

build() {
	cd "$srcdir/TerraFirma-$pkgver"
	qmake CONFIG+=optimize_full
	make
}

package() {
	cd "$srcdir/TerraFirma-$pkgver"
	INSTALL_ROOT="$pkgdir" make install
}
