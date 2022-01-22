# Maintainer: Christian Weller <christian@jundar.de>
pkgname=brother-mfc-j5945dw-cups
pkgver=1.0.0
pkgrel=1
pkgdesc="LPR driver for Brother MFC-J5945DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfcj5945dw_us_eu_as"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf103902/mfcj5945dwpdrv-1.0.0-0.i386.deb")
md5sums=("1c4e1872cc8116bde49f15b5dd7861d0")

depends=('cups' 'ghostscript' 'psutils')
depends_x86_64=('lib32-glibc')
optdepends=('brscan4')

pkgver() {
    printf "%s" $pkgver
}

package() {
        tar -xf data.tar.gz -C "${pkgdir}"
        install -m 755 -D "${pkgdir}/opt/brother/Printers/mfcj5945dw/cupswrapper/brother_mfcj5945dw_printer_en.ppd" "${pkgdir}/usr/share/ppd/cupsfilters/brother_mfcj5945dw_printer_en.ppd"
        install -m 755 -D "${pkgdir}/opt/brother/Printers/mfcj5845dw/cupswrapper/brother_lpdwrapper_mfcj5945dw" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_mfcj5945dw"

}
