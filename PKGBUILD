# Maintainer: OrnelasD-Rogers <https://github.com/OrnelasD-Rogers>
pkgname=acer-nitro-ec-dkms
pkgver=1.0.0
pkgrel=1
pkgdesc="Acer Nitro AN515/AN517 EC fan control driver (hwmon, DKMS)"
arch=('any')
url="https://github.com/OrnelasD-Rogers/acer-nitro-ec"
license=('GPL-2.0-only')
depends=('dkms')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('12b3d15144f6e1282c6accb0bb40788dd6f05b1e854fbbd4afc5cfd9dea09e36')

package() {
	cd "$srcdir/acer-nitro-ec-$pkgver"

	local dest="$pkgdir/usr/src/acer-nitro-ec-$pkgver"
	install -dm755 "$dest"

	install -m644 acer-nitro-ec.c "$dest/"
	install -m644 Makefile         "$dest/"
	install -m644 dkms.conf        "$dest/"

	sed -i "s/@PKGVER@/$pkgver/" "$dest/dkms.conf"
}
