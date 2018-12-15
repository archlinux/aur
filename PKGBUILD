# Maintainer: Ben Merritt <blm768@gmail.com>
# Contributor: Jesse Jaara <jesse.jaara: gmail.com>

pkgname=pi-bluetooth
pkgver=1
pkgrel=2
pkgdesc="Services, firmware and udev rules to get integrated bluetooth running in Raspberry Pi 3"
arch=('armv6h' 'armv7h' 'aarch64')
url=""
license=('multiple')
depends=('bluez-utils')
install=pi-bluetooth.install
source=(
    https://raw.githubusercontent.com/RPi-Distro/bluez-firmware/master/broadcom/BCM43430A1.hcd
    https://raw.githubusercontent.com/RPi-Distro/bluez-firmware/master/broadcom/BCM4345C0.hcd
    LICENCE.broadcom_bcm43xx
    brcm43438.service
)
sha256sums=(
    '8dd70b9003d39cb6175b4f3cd509666dad66ad23d3be1a68385817fb814c8930'
    '042a8c234beaa9abb8d6156430e44af983f861036e1d54ffe8cabcc0dab76a43'
    'b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d'
    'b4a84d669984424c7994c5a4bcbf65e1818b04c65849ac4d6ed56592a8075ec7'
)

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/lib/firmware"
  mkdir -p "${pkgdir}/usr/share/licences"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  
  cp BCM43430A1.hcd BCM4345C0.hcd "${pkgdir}/usr/lib/firmware/"
  cp LICENCE.broadcom_bcm43xx "${pkgdir}/usr/share/licences/"
  cp brcm43438.service "${pkgdir}/usr/lib/systemd/system/"
}
