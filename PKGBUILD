# Maintainer: Sematre <sematre at gmx dot de>
pkgname=rpcs3-udev
pkgver=r1
pkgrel=2
pkgdesc="udev rules to allow RPCS3 to communicate with DualShock 3 and 4 controllers."
arch=('any')
url="https://wiki.rpcs3.net/index.php?title=Help:Controller_Configuration"
license=('CCPL:by-sa-4.0')
install=reload-udev-daemon.install
source=("99-ds3-controllers.rules"
        "99-ds4-controllers.rules")
sha256sums=('f79b90f75ff0937472c1dc8fbb306e113fdc5ef97b804df9e5fb4f6e2a217a83'
            'a4b2774e83206878e115761853f1742847a640ed6ea245995ed2fcd6756836b6')

package() {
	cd "${srcdir}"
	find . -name "*.rules" -exec install -Dm644 "{}" -t "${pkgdir}/etc/udev/rules.d/" \;
}
