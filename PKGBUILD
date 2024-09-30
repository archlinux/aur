# Maintainer: Furkan Kardame <tech@fkardame.com>
pkgname=cammus-rules
_pkgname="${pkgname%-*}"
pkgver=1.0.0
pkgrel=1
pkgdesc='udev rules for Cammus devices'
arch=(any)
url="https://github.com/spikerguy/"
license=(GPL2)
depends=(dkms)
install=${pkgname}.install
makedepends=(joyutils)
source=('cammus.rules'
		'cp5-pedal.sh')
b2sums=('b7c6687cf7737aebebed6a0c531b7f51042c7e0b920c3d2e5b6916277428c975759ccaf51b245c7e70dd7f6c4e54289559442f95b4168a889e6c358c48ff7485'
        'ec4dfd2fd6872ff16bd73fcf01e78d3e54413f3da6fcf5c0e0c686cec6e0eee0f302ee63d25bbd2e67622e3d85605ad48e6fae212037297b5b8483fd693859aa')

package() {
	install -Dm 0644 -T cammus.rules "${pkgdir}/usr/lib/udev/rules.d/99-cammus.rules"
	install -Dm 0755  cp5-pedal.sh -t "${pkgdir}/usr/bin/"
}
