# Maintainer: picokan <todaysoracvle@protonmail.com>

pkgname=bazarr-runit
pkgver=20240411
pkgrel=1
pkgdesc="Runit service script for bazarr."
arch=("any")
url="https://bazarr.media"
license=("GPL-3.0")
depends=("bazarr" "runit")
install=bazarr.install
source=("bazarr.run" "bazarr.log.run")
sha256sums=('7232c3971621d3afa8f8377fee91c10e27eb7e1184861d96708906cfeccfd7f0'
            '2ea2c9f8c8fd2e140f8f1e0a43db5e1cdff91a6f1d95599bda58cae5d609a717')

package() {
	cd "$srcdir"
	install -Dm755 bazarr.run "$pkgdir/etc/runit/sv/bazarr/run"
	install -Dm755 bazarr.log.run "$pkgdir/etc/runit/sv/bazarr/log/run"
}
