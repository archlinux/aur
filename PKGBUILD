# Maintainer: YoyPa <yoann dot p dot public at gmail dot com>
pkgname=fluffy-switch
pkgver=2.5
pkgrel=2
pkgdesc="Goldtree and Tinfoil GUI for USB install on switch"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/fourminute/Fluffy"
license=('GPL')
depends=(
	'python-pyusb'
	'libusb'
	'python-pyqt5'
	'tk'
)
optdepends=(
	'python-qdarkstyle: dark theme toggle in fluffy'
)
backup=(
	'etc/udev/rules.d/80-fluffy-switch.rules'
)
source=("Fluffy-${pkgver}.tar.gz::https://github.com/fourminute/Fluffy/archive/v${pkgver}.tar.gz")
sha256sums=('3eaa06c5a3569cee191c3d96de8622bf41812117a07e47758c290d33bd817d18')

package() {
	cd "Fluffy-${pkgver}"
	install -Dm 644 linux/80-fluffy-switch.rules "${pkgdir}/etc/udev/rules.d/80-fluffy-switch.rules"
	install -Dm 644 linux/fluffy.desktop "${pkgdir}/usr/share/applications/fluffy.desktop"
	install -Dm 644 icons/16x16/fluffy.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/fluffy.png"
	install -Dm 644 icons/24x24/fluffy.png "${pkgdir}/usr/share/icons/hicolor/24x24/apps/fluffy.png"
	install -Dm 644 icons/32x32/fluffy.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/fluffy.png"
	install -Dm 644 icons/48x48/fluffy.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/fluffy.png"
	install -Dm 644 icons/64x64/fluffy.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/fluffy.png"
	install -Dm 644 icons/128x128/fluffy.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/fluffy.png"
	install -Dm 755 fluffy.pyw "${pkgdir}/usr/bin/fluffy"
}
