# Maintainer: Jesse Jaara <jesse.jaara: gmail.com>

pkgname=pi-bluetooth
pkgver=1
pkgrel=1
pkgdesc="Services, firmware and udev rules to get integrated bluetooth running in Raspberry Pi 3"
arch=('armv7h')
url=""
license=('multiple')
depends=('hciattach-rpi3')
install=pi-bluetooth.install
source=(BCM43430A1.hcd
        brcm43438.service
        LICENCE.broadcom_bcm43xx
        50-bluetooth-hci-auto-poweron.rules)
md5sums=('b95ee9032a723daa25ab9608a515e984'
         '89d9171e5693d7d3b0a3ee1710dcbe0c'
         '3160c14df7228891b868060e1951dfbc'
         'd236124f0a979685154e4e57dfebafd5')

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  mkdir -p "${pkgdir}/etc/firmware"
  mkdir -p "${pkgdir}/etc/udev/rules.d"
  mkdir -p "${pkgdir}/usr/share/licences"
  
  cp BCM43430A1.hcd "${pkgdir}/etc/firmware/"
  cp brcm43438.service "${pkgdir}/usr/lib/systemd/system/"
  cp 50-bluetooth-hci-auto-poweron.rules "${pkgdir}/etc/udev/rules.d/"
  cp LICENCE.broadcom_bcm43xx "${pkgdir}/usr/share/licences/"
}
