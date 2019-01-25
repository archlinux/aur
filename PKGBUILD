# Maintainer: YoyPa <yoann dot p dot public at gmail dot com>
pkgname=fluffy-switch
pkgver=2.2
pkgrel=2
pkgdesc="Goldtree and Tinfoil GUI for USB install on switch"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/fourminute/Fluffy"
license=('GPL')
depends=(
	'python-pyusb'
	'libusb'
	'python-pyqt5'
)
optdepends=(
	'python-qdarkstyle: dark theme recommanded by author'
)
source=("Fluffy-${pkgver}.tar.gz::https://github.com/fourminute/Fluffy/archive/v${pkgver}.tar.gz")
sha256sums=('e1ee082985de616c5c83180f2fa7ce371a1ea7e1e92d991dd673d397a5557499')

package() {
	cd "Fluffy-$pkgver"
	install -Dm 644 80-fluffy-switch.rules "$pkgdir/etc/udev/rules.d/80-fluffy-switch.rules
	install -Dm 755 fluffy.pyw "$pkgdir/usr/bin/fluffy-switch
}