pkgname=terrafirma
pkgver=3.0.19
pkgrel=1
pkgdesc='Mapping for Terraria'
arch=('any')
url='http://seancode.com/terrafirma'
license=(BSD)
depends=()
makedepends=(qt5-base qt5-tools)
source=("https://github.com/mrkite/TerraFirma/archive/$pkgver.tar.gz")
sha256sums=('d7d3bac506c9140baa3c622c3d61449c220ff45a58eae8465aa6dff536c09dae')

build() {
	cd "$srcdir/TerraFirma-$pkgver"
	qmake CONFIG+=optimize_full
	make
}

package() {
	cd "$srcdir/TerraFirma-$pkgver"
	INSTALL_ROOT="$pkgdir" make install
}
