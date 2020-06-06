pkgname=terrafirma
pkgver=3.1.1
pkgrel=1
pkgdesc='Mapping for Terraria'
arch=('any')
url='http://seancode.com/terrafirma'
license=(BSD)
depends=()
makedepends=(qt5-base qt5-tools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mrkite/TerraFirma/archive/$pkgver.tar.gz")
sha256sums=('b02ff54c9b781825d986c067fb49ca55e30a29a00a24ce971eefcf018fa521c9')

build() {
	cd "$srcdir/TerraFirma-$pkgver"
	qmake CONFIG+=optimize_full
	make
}

package() {
	cd "$srcdir/TerraFirma-$pkgver"
	INSTALL_ROOT="$pkgdir" make install
}
