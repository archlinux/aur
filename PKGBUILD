# Maintainer: Elier Lopez <elier.lopezg@hotmail.com>
pkgname=brother-mfc-j5845dw
pkgver=1.0.0
pkgrel=1
pkgdesc="LPR driver and CUPS wrapper for Brother MFC-J5845DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfcj5845dw_us"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf103885/mfcj5845dwpdrv-1.0.0-0.i386.deb")
md5sums=("1a273e62c454f8000e79350cd8bfe57e")
depends=()
depends_x86_64=('lib32-glibc')
optdepends=('brscan4')

pkgver() {
    printf "%s" $pkgver
}

package() {
        tar -xf data.tar.gz -C "${pkgdir}"
        install -m 755 -D "${pkgdir}/opt/brother/Printers/mfcj5845dw/cupswrapper/brother_mfcj5845dw_printer_en.ppd" "${pkgdir}/usr/share/ppd/cupsfilters/brother_mfcj5845dw_printer_en.ppd"
        install -m 755 -D "${pkgdir}/opt/brother/Printers/mfcj5845dw/cupswrapper/brother_lpdwrapper_mfcj5845dw" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_mfcj5845dw"
}
