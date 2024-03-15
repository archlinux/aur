# Maintainer: picokan <todaysoracvle@protonmail.com>

pkgname=radarr-runit
pkgver=20240313
pkgrel=1
pkgdesc="Runit service script for radarr."
arch=("any")
url="https://radarr.video"
license=("GPL-3.0")
depends=("radarr" "runit")
source=("radarr.run" "radarr.log.run")
sha256sums=('22b13bc1d2db05134e96d6d8d1be8d1488d610599c4a1c8ad9ad2c9e7be73d37'
            '63143f6eb852d9e0fb0b2cb48eea7918b2a225d9bb228a0df562237f95a015fe')

package() {
	cd "$srcdir"
	install -Dm755 radarr.run "$pkgdir/etc/runit/sv/radarr/run"
	install -Dm755 radarr.log.run "$pkgdir/etc/runit/sv/radarr/log/run"
}
