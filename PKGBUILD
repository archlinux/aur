# Maintainer: Oscar Harris <oscar@oscar-h.com>

pkgname=brother-dcp-l5500dn-lpr-bin
pkgver=3.5.1
pkgrel=2
pkgdesc="LPR driver for Brother DCP-L5500DN printer"
arch=("i686" "x86_64")
url="http://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=dcpl5500dn_us_eu"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf102577/dcpl5500dnlpr-3.5.1-1.i386.deb")
sha512sums=("9637e8f5c003c4c826c37fb76f28fb39747eca63d5df7022da0ce63677a442c8ce8c40851f215c3b4ec54f06fdbcf76d33ad3b3bbd1dda91716e932e3b0ab0fc")

package() {
	# This script is adapted from brother-mfc-l2710dw. Credit to enginefeeder101 for the links

	# Extract data from .deb package
	tar -xf data.tar.gz -C "${pkgdir}"

	# Link architecture specific binaries to parent directory
	ln -s "/opt/brother/Printers/DCPL5500DN/lpd/$CARCH/brprintconflsr3" "${pkgdir}/opt/brother/Printers/DCPL5500DN/lpd/"
	ln -s "/opt/brother/Printers/DCPL5500DN/lpd/$CARCH/rawtobr3" "${pkgdir}/opt/brother/Printers/DCPL5500DN/lpd/"
	
	# Link inf to lpd as it tries to execute there (may not be needed)
	ln -s "/opt/brother/Printers/DCPL5500DN/inf" "${pkgdir}/opt/brother/Printers/DCPL5500DN/lpd/"
}
