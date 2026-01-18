# Maintainer: picokan <todaysoracle@protonmail.com>

pkgname=coolercontrold-runit
pkgver=20260118
pkgrel=1
pkgdesc="Runit service script for coolercontrold."
arch=("any")
url="https://gitlab.com/coolercontrol/coolercontrol"
license=("GPL-3.0-or-later")
depends=("coolercontrold" "runit")
source=("coolercontrold.run" "coolercontrold.log.run")
sha256sums=('e05796e6a1e863340c45cc8827ffbded3e9c0ee17f32aa5f99484ecf4b141466'
            '35dac3e83f142ff34ecdc5f907735f086371099ff4ca9dea2b7873095cb2ccd9')

package() {
	cd "$srcdir"
	install -Dm755 coolercontrold.run "$pkgdir/etc/runit/sv/coolercontrold/run"
	install -Dm755 coolercontrold.log.run "$pkgdir/etc/runit/sv/coolercontrold/log/run"
}
