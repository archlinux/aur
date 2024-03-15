# Maintainer: picokan <todaysoracvle@protonmail.com>

pkgname=sonarr-runit
pkgver=20240312
pkgrel=1
pkgdesc="Runit service script for sonarr."
arch=("any")
url="https://sonarr.tv"
license=("GPL-3.0")
depends=("sonarr" "runit")
source=("sonarr.run" "sonarr.log.run")
sha256sums=('aca6062b6142c2c0b2e86c8ae241c6c4a48df813cf0f06e4067258bf4c551d12'
            '264bdf53fc0f1ba5ff98a673b7227277dd6d4e6a45eb4e8c7458cc89a4b6b0e9')

package() {
	cd "$srcdir"
	install -Dm755 sonarr.run "$pkgdir/etc/runit/sv/sonarr/run"
	install -Dm755 sonarr.log.run "$pkgdir/etc/runit/sv/sonarr/log/run"
}
