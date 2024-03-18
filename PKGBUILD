# Maintainer: picokan <todaysoracvle@protonmail.com>

pkgname=bazarr-runit
pkgver=20240318
pkgrel=4
pkgdesc="Runit service script for bazarr."
arch=("any")
url="https://bazarr.media"
license=("GPL-3.0")
depends=("bazarr" "runit")
install=bazarr.install
source=("bazarr.run" "bazarr.log.run")
sha256sums=('e821ff8bbe5fb97c4711c829983840577220185c535505c36e3c8abb0bcd4067'
            '2ea2c9f8c8fd2e140f8f1e0a43db5e1cdff91a6f1d95599bda58cae5d609a717')

package() {
	cd "$srcdir"
	install -Dm755 bazarr.run "$pkgdir/etc/runit/sv/bazarr/run"
	install -Dm755 bazarr.log.run "$pkgdir/etc/runit/sv/bazarr/log/run"
}
