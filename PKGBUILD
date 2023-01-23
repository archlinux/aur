# Maintainer: Sematre <sematre at gmx dot de>
pkgname=rpcs3-udev
pkgver=2022.12.26
pkgrel=1
pkgdesc="udev rules to allow RPCS3 to communicate with DualShock 3, 4 and DualSense controllers."
arch=('any')
url="https://wiki.rpcs3.net/index.php?title=Help:Controller_Configuration"
license=('CCPL:by-sa-4.0')
install=reload-udev-daemon.install
source=("99-ds3-controllers.rules"
        "99-ds4-controllers.rules"
        "99-dualsense-controllers.rules")
sha256sums=('f79b90f75ff0937472c1dc8fbb306e113fdc5ef97b804df9e5fb4f6e2a217a83'
            'a4b2774e83206878e115761853f1742847a640ed6ea245995ed2fcd6756836b6'
            '586e7aa693b2c5a87cf41bf2b98fec7113985e36d3b360ad415ee9e9dfff7525')

package() {
	cd "${srcdir}"
	find . -name "*.rules" -exec install -Dm644 "{}" -t "${pkgdir}/etc/udev/rules.d/" \;
}
