# Maintainer: CupIvan <mail@cupivan.ru>
pkgname=xprinter-ppd
pkgver=3.13.55
pkgrel=1
pkgdesc="CUPS driver for Xprinter XP-420B, XP-DT325B, XP-H400B, XP-TT325B series"
url="https://www.xprintertech.com/drivers-2"
arch=('x86_64')
options=('!debug')

source=(
	"package.rar::https://www.xprintertech.com/label-printer-linux"
)
sha256sums=(
	'56da6a61aff7e9e51174e99f63debb690cf4864f5b45fe4325c02bc7f6d54d4c'
)

build() {
	FNAME="printer-driver-xprinter_3.13.55_all.deb"
	ar xv $FNAME
	tar -xJf data.tar.xz
}

package() {
	install -Dm755 "./opt/xprinter_printer/printer-driver-xprinter/bin/rastertosnailtspl-x64" "${pkgdir}/usr/lib/cups/filter/rastertosnailtspl-xprinter"
	cp -r ./usr ${pkgdir}
}
