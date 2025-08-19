# Maintainer: Christian Weller <christian at jundar dot de>
pkgname=brother-mfc-j5945dw-cups
pkgver=1.0.0
pkgrel=2
pkgdesc="LPR driver for Brother MFC-J5945DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfcj5945dw_us_eu_as"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf103902/mfcj5945dwpdrv-1.0.0-0.i386.deb")
sha256sums=("d2f5036bd319c80aa47f644e4dfcdf0290d73aa6dfe21b4c764a2a626e39c39d")

depends=('cups' 'ghostscript' 'psutils')
depends_x86_64=('lib32-glibc')
optdepends=('brscan4')

pkgver() {
    printf "%s" $pkgver
}

package() {
        tar -xf data.tar.gz -C "${pkgdir}"
        install -m 755 -D "${pkgdir}/opt/brother/Printers/mfcj5945dw/cupswrapper/brother_mfcj5945dw_printer_en.ppd" "${pkgdir}/usr/share/ppd/cupsfilters/brother_mfcj5945dw_printer_en.ppd"
        install -m 755 -D "${pkgdir}/opt/brother/Printers/mfcj5945dw/cupswrapper/brother_lpdwrapper_mfcj5945dw" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_mfcj5945dw"

}
