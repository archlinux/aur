pkgname=terrafirma
pkgver=3.1.11
pkgrel=1
pkgdesc='Mapping for Terraria'
arch=('any')
url='http://seancode.com/terrafirma'
license=(BSD)
depends=(qt5-base)
makedepends=(qt5-tools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mrkite/TerraFirma/archive/v$pkgver.tar.gz")
sha256sums=('b73099293a55e56c227d651554c8ab7ea3ab6e0239f77d1387fab7e13e3eb60f')

build() {
	cd "$srcdir/TerraFirma-$pkgver"
	qmake CONFIG+=optimize_full
	make
}

package() {
	cd "$srcdir/TerraFirma-$pkgver"
	INSTALL_ROOT="$pkgdir" make install
}
