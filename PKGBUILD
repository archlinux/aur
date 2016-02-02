# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Contributor: Christopher Reimer <mail+aur[at]c-reimer[dot]de>

pkgname=bcm20702a1-firmware
pkgver=1201650
pkgrel=2
pkgdesc="Firmware for BCM20702A1 based devices (0b05:17cb, 0b05:17cf and 05ac:21e1)"
arch=('any')
url="http://asus.com"
license=("Custom")
makedepends=('bluez-utils')
source=("http://dlcdnet.asus.com/pub/ASUS/misc/BT/Bluetooth_V${pkgver}_WHQL_Win10.zip")
sha256sums=('b8863fdb2f397c1ca7264fd4a0f457c2f9ab90350338e476128fb241720e32ad')

build() {
  hex2hcd "$srcdir/Bluetooth/BCM_DriverOnly/64/BCM20702A1_001.002.014.1443.1467.hex" -o "${srcdir}/BCM20702A1-0b05-17cb.hcd"
  hex2hcd "$srcdir/Bluetooth/BCM_DriverOnly/64/BCM20702A1_001.002.014.1443.1469.hex" -o "${srcdir}/BCM20702A1-0b05-17cf.hcd"
  hex2hcd "$srcdir/Bluetooth/BCM_DriverOnly/64/BCM20702A1_001.002.014.1483.1647.hex" -o "${srcdir}/BCM20702A0-05ac-21e1.hcd"
}

package() {
  mkdir -p ${pkgdir}/usr/lib/firmware/brcm
  install -m644 "${srcdir}/BCM20702A1-0b05-17cb.hcd" "${pkgdir}/usr/lib/firmware/brcm/BCM20702A1-0b05-17cb.hcd"
  install -m644 "${srcdir}/BCM20702A1-0b05-17cf.hcd" "${pkgdir}/usr/lib/firmware/brcm/BCM20702A1-0b05-17cf.hcd"
  install -m644 "${srcdir}/BCM20702A0-05ac-21e1.hcd" "${pkgdir}/usr/lib/firmware/brcm/BCM20702A0-05ac-21e1.hcd"
}

