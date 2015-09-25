pkgname=mt7601u-firmware
pkgver=3.0.0.4_20130913
pkgrel=1
pkgdesc="Firmware for Mediatek MT7601U USB bgn WiFi dongle, needed for linux 4.2+"
arch=('i686' 'x86_64')
url="https://github.com/kuba-moo/$_gitname"
license=('Unknown')
options=(!strip)
source=("http://www.mediatek.com/AmazonS3/Downloads/linux/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913.tar.bz2")
md5sums=('5f440dccc8bc952745a191994fc34699')

package() {
   cd "$srcdir/$_gitname"
   # Installing Formal firmware, has much never timestamp (201302052146 vs 201308222153)
   install -Dm644 "$srcdir/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/mcu/bin/MT7601_formal_1.7.bin" "$pkgdir/usr/lib/firmware/mt7601u.bin"
}
