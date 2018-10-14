# Maintainer: Michal Ulianko <michal dot ulianko at gmail dot com>
# Maintainer: Daan de Graaf <daan de graaf 9 at gmail dot com>
pkgname=gnuarmeclipse-qemu-bin
pkgver=2.8.0_3_20180523
pkgrel=1
pkgdesc="The GNU MCU Eclipse QEMU is a fork of the public open-source QEMU project, customised for more support of Cortex-M cores, and a better integration with the GNU ARM QEMU Debugging plug-in."
arch=('x86_64')
url="http://gnuarmeclipse.github.io/qemu/"
license=('GPL')
provides=('qemu-system-gnuarmeclipse')
options=(!strip)
source=("https://github.com/gnu-mcu-eclipse/qemu/releases/download/v2.8.0-3-20180523/gnu-mcu-eclipse-qemu-2.8.0-3-20180523-0703-centos64.tgz")
sha256sums=('d4260a47b3322bce6d8d74feb2409b04c45f0b18a2958bb04ed2c802abf60793')

package() {
    install -d "${pkgdir}/opt/gnuarmeclipse/qemu"
    install -d "${pkgdir}/usr/bin"
	cp -r "${srcdir}/gnu-mcu-eclipse/qemu/2.8.0-3-20180523-0703/"* "${pkgdir}/opt/gnuarmeclipse/qemu/" -R
    ln -s /opt/gnuarmeclipse/qemu/bin/qemu-system-gnuarmeclipse "${pkgdir}"/usr/bin/qemu-system-gnuarmeclipse
}
