# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=dvb-firmware
pkgver=2014.11.25
pkgrel=2
# ToDo: Better description or one less redundant
pkgdesc="LinuxTV firmware bundle from the LinuxTV project"
arch=("any")
url="http://linuxtv.org/downloads/firmware/"
license=("custom")
source=("$pkgname-$pkgver.tar.bz2::http://linuxtv.org/downloads/firmware/dvb-firmwares.tar.bz2")

package() {
	# ToDo: Create a "for $1" intead of this mess to fix the case
	#	if new firmware is added to the linux-firmware package
	#	it will be easier to not copy it than the actual way
	mkdir -p "$pkgdir/usr/lib/firmware"
	cp -a $srcdir/*.fw*	"$pkgdir/usr/lib/firmware"

	# These now are part of Linux-firmware, remove it to allow both to live together and happy
	rm $pkgdir/usr/lib/firmware/v4l-cx23{1xx-avcore-01,418-apu,418-cpu,418-dig,885-avcore-01}.fw
	rm $pkgdir/usr/lib/firmware/dvb-{fe-xc5000-1.6.114,usb-dib0700-1.20,usb-terratec-h5-drxk}.fw
	rm $pkgdir/usr/lib/firmware/v4l-cx25840.fw
	rm $pkgdir/usr/lib/firmware/dvb-fe-{xc4000-1.4.1,xc5000c-4.1.30.7}.fw
	rm $pkgdir/usr/lib/firmware/dvb-usb-it9135-{01,02}.fw
	rm $pkgdir/usr/lib/firmware/sms1xxx-{hcw-55xxx-dvbt-02,hcw-55xxx-isdbt-02,nova-a-dvbt-01,nova-b-dvbt-01,stellar-dvbt-01}.fw 
}

# md5 is the default in makepkg -g, so I use it, blame Allan McRae
md5sums=('a77a0564e1c2ade6dd552669cb12b71f')
