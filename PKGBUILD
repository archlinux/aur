# Maintainer: Bart Verhagen <barrie.verhagen@gmail.com>
pkgname=brother-mfc-j1300dw
pkgver=1.0.5
pkgrel=1
pkgdesc="LPR driver and CUPS wrapper for Brother MFC-J1300DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=mfcj1300dw_eu_as"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf103813/mfcj1300dwpdrv-1.0.5-0.i386.deb")
md5sums=("c260230993837cff7447e0c101bcb5a0")
depends=()
depends_x86_64=('lib32-glibc')
optdepends=('brscan4')

pkgver() {    
    printf "%s" $pkgver    
}

package() {
        tar -xf data.tar.gz -C "${pkgdir}"
        install -m 755 -D "${pkgdir}/opt/brother/Printers/mfcj1300dw/cupswrapper/brother_mfcj1300dw_printer_en.ppd" "${pkgdir}/usr/share/ppd/cupsfilters/brother_mfcj1300dw_printer_en.ppd"
        install -m 755 -D "${pkgdir}/opt/brother/Printers/mfcj1300dw/cupswrapper/brother_lpdwrapper_mfcj1300dw" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_mfcj1300dw"
}
