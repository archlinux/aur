# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgname=bcm20702a1-firmware
pkgver=1201550
pkgrel=1
pkgdesc="Firmware for BCM20702A1 based ASUS X99 USB bluetooth devices (0b05:17cf)"
arch=(any)
url="http://linuxtv.org/wiki/index.php/Afatech_AF9005"
license=("Custom")
makedepends=('hex2hcd')
source=("http://dlm3cdnet.asus.com/pub/ASUS/misc/BT/Bluetooth_V${pkgver}_Win10.zip")
sha256sums=('fe1efb02a5779f67ffecce79d44622e7e2795a9b31352e0f490f63bb471a78d1')
provides=('linux-firmware')

build() {
  cd "${srcdir}"
  cp "${srcdir}/Bluetooth_V1201550_Win10/Win32/BCM20702A1_001.002.014.1443.1469.hex" "${srcdir}/"
  hex2hcd "${srcdir}/BCM20702A1_001.002.014.1443.1469.hex" "${srcdir}/BCM20702A1-0b05-17cf.hcd"
}

package() {
  mkdir -p ${pkgdir}/usr/lib/firmware/brcm
  install -m644 "${srcdir}/BCM20702A1-0b05-17cf.hcd" "${pkgdir}/usr/lib/firmware/brcm/BCM20702A1-0b05-17cf.hcd"
}

