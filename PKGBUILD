# Maintainer: Sematre <sematre at gmx dot de>
pkgname=rpcs3-udev
pkgver=r1
pkgrel=1
pkgdesc="udev rules to allow RPCS3 to communicate with DualShock 3 and 4 controllers."
arch=('any')
url="https://wiki.rpcs3.net/index.php?title=Help:Controller_Configuration"
license=('CCPL:by-sa-4.0')

prepare() {
	cd "${srcdir}"
	ln -s ../ds3-controllers.rules 99-ds3-controllers.rules
	ln -s ../ds4-controllers.rules 99-ds4-controllers.rules
}

package() {
	cd "${srcdir}"
	find . -name "*.rules" -exec install -Dm644 "{}" -t "${pkgdir}/etc/udev/rules.d/" \;
}
