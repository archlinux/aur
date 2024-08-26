# Maintainer: Sematre <sematre at gmx dot de>
# Contributor: Max Gautier <mg@max.gautier.name>
pkgname=rpcs3-udev
pkgver=2024.07.15
pkgrel=2
pkgdesc="udev rules to allow RPCS3 to communicate with DualShock 3, 4 and DualSense controllers."
arch=('any')
url="https://wiki.rpcs3.net/index.php?title=Help:Controller_Configuration"
license=('CCPL:by-sa-4.0')
source=("99-ds3-controllers.rules"
        "99-ds4-controllers.rules"
        "99-dualsense-controllers.rules")
sha256sums=('107951a1af5a85832e5eb85f1255c6d3a466544fa1a14a1db788c418b9a108df'
            'a4b2774e83206878e115761853f1742847a640ed6ea245995ed2fcd6756836b6'
            '586e7aa693b2c5a87cf41bf2b98fec7113985e36d3b360ad415ee9e9dfff7525')

package() {
	cd "${srcdir}"
	find . -name "*.rules" -exec install -Dm644 "{}" -t "${pkgdir}/usr/lib/udev/rules.d/" \;
}
