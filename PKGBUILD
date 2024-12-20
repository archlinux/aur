# Maintainer: Robert Hawdon <git@robertianhawdon.me.uk>

pkgname=brother-dcpl3510cdw-drv-bin
pkgver=1.0.2
pkgrel=3
pkgdesc="Printer driver for Brother DCP-L3510CDW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=dcpl3510cdw_eu_as"
license=("EULA")
groups=("base-devel")
depends=("cups" "lib32-glibc")
source=("https://download.brother.com/welcome/dlf103918/dcpl3510cdwpdrv-1.0.2-0.i386.deb")
sha1sums=("28731d82c58b5698927bc5175a875e309954f1c5")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
	install -d "${pkgdir}/usr/lib/cups/filter/"
	install -d "${pkgdir}/usr/share/ppd/cupsfilters/"
	ln -sf /opt/brother/Printers/dcpl3510cdw/cupswrapper/brother_lpdwrapper_dcpl3510cdw "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_dcpl3510cdw"
	ln -sf /opt/brother/Printers/dcpl3510cdw/cupswrapper/brother_dcpl3510cdw_printer_en.ppd "${pkgdir}/usr/share/ppd/cupsfilters/brother_dcpl3510cdw_printer_en.ppd"
}
