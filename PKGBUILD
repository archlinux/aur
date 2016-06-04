# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Contributor: Christopher Reimer <archlinux@tjbp.net>
# Contributor: Christoph Hoopmann <christophhoopmann@gmail.com>

pkgname=bcm20702a1-firmware
pkgver=1201650
pkgrel=4
pkgdesc="Firmware for BCM20702A1 based devices (0b05:17cb, 0b05:17cf, 0a5c:21e1, 0a5c:21e6, 0a5c:21e8)"
arch=('any')
url="http://asus.com"
license=("Custom")
makedepends=('bluez-utils')
source=("http://dlcdnet.asus.com/pub/ASUS/misc/BT/Bluetooth_V${pkgver}_WHQL_Win10.zip"
        "BCM20702A1-0a5c-21e8.hcd::https://s3.amazonaws.com/plugable/bin/fw-0a5c_21e8.hcd")
sha256sums=('b8863fdb2f397c1ca7264fd4a0f457c2f9ab90350338e476128fb241720e32ad'
            'd699c13fe1e20c068a8a88dbbed49edc12527b0ceeeaac3411e3298573451536')

build() {
  hex2hcd "$srcdir/Bluetooth/BCM_DriverOnly/64/BCM20702A1_001.002.014.1443.1467.hex" -o "${srcdir}/BCM20702A1-0b05-17cb.hcd"
  hex2hcd "$srcdir/Bluetooth/BCM_DriverOnly/64/BCM20702A1_001.002.014.1443.1469.hex" -o "${srcdir}/BCM20702A1-0b05-17cf.hcd"
  hex2hcd "$srcdir/Bluetooth/BCM_DriverOnly/64/BCM20702A1_001.002.014.1483.1647.hex" -o "${srcdir}/BCM20702A0-0a5c-21e1.hcd"
  hex2hcd "$srcdir/Bluetooth/BCM_DriverOnly/64/BCM20702A1_001.002.014.1483.1669.hex" -o "${srcdir}/BCM20702A1-0a5c-21e6.hcd"
}

package() {
  mkdir -p ${pkgdir}/usr/lib/firmware/brcm
  install -m644 "${srcdir}/BCM20702A1-0b05-17cb.hcd" "${pkgdir}/usr/lib/firmware/brcm/BCM20702A1-0b05-17cb.hcd"
  install -m644 "${srcdir}/BCM20702A1-0b05-17cf.hcd" "${pkgdir}/usr/lib/firmware/brcm/BCM20702A1-0b05-17cf.hcd"
  install -m644 "${srcdir}/BCM20702A0-0a5c-21e1.hcd" "${pkgdir}/usr/lib/firmware/brcm/BCM20702A0-0a5c-21e1.hcd"
  install -m644 "${srcdir}/BCM20702A1-0a5c-21e6.hcd" "${pkgdir}/usr/lib/firmware/brcm/BCM20702A1-0a5c-21e6.hcd"
  install -m644 "${srcdir}/BCM20702A1-0a5c-21e8.hcd" "${pkgdir}/usr/lib/firmware/brcm/BCM20702A1-0a5c-21e8.hcd"
}

