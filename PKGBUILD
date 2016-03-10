# Maintainer: James Crompton <donjaime at freenet de>

pkgname=bt-dw1560-firmware
pkgver=1.0
pkgrel=1
pkgdesc="Bluetooth firmware for Dell DW1560 802.11ac (Broadcom BCM4352) adapter"
arch=(any)
url=""
license=('proprietary')
makedepends=(cabextract bluez-utils)
provides=(bt-dw1560-firmware)
source=('http://download.windowsupdate.com/d/msdownload/update/driver/drvs/2014/07/20662520_6c535fbfa9dca0d07ab069e8918896086e2af0a7.cab')
md5sums=('e7163c3e02906f075bac01a5489feacb')

package() {
	cd $srcdir
	cabextract 20662520_6c535fbfa9dca0d07ab069e8918896086e2af0a7.cab
	hex2hcd BCM20702A1_001.002.014.1443.1572.hex
	install -D -T -m644 BCM20702A1_001.002.014.1443.1572.hcd $pkgdir/usr/lib/firmware/brcm/BCM20702A1-0a5c-216f.hcd
	cd $pkgdir/usr/lib/firmware/brcm/
	ln -rs BCM20702A1-0a5c-216f.hcd BCM20702A0-0a5c-216f.hcd
}


