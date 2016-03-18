# Maintainer: Jristz <prflr88@gmail.com>

pkgname=libertas-firmware
pkgver=9.70.7.p0.0
pkgrel=2
pkgdesc="Firmware for Marvell's libertas wireless chip series"
url="http://dev.laptop.org/pub/firmware/libertas/"
license=("custom")
arch=("any")
# Use Debian Sid source, they found (now) missing firmwares in upstream server
source=("$pkgname.tar.gz::http://ftp.de.debian.org/debian/pool/non-free/libe/libertas-firmware/libertas-firmware_9.70.7.p0.0.orig.tar.gz"
	"License")

package(){
	install -d 644 "$pkgdir/usr/lib/firmware"
	install -d 644 "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 755 "$srcdir/License" "$pkgdir/usr/share/doc/$pkgname"
	cp -r -a $srcdir/$pkgname-$pkgver/*bin $pkgdir/usr/lib/firmware
	rm "$pkgdir/usr/lib/firmware/lbtf_usb.bin"
}

md5sums=('65bc820fa3afbd8dfb420d7bd77eaca0'
         'c82933358ba7f6c9fd546d061a79de99')
