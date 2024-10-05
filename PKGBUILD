# Maintainer: Filip Gralinski <filipg@ceti.pl>

pkgname=brother-dcpl8410cdw-lpr-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="LPR driver for Brother DCP-L8410CDW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=dcpl8410cdw_eu"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf103213/dcpl8410cdwlpr-1.5.0-0.i386.rpm")
md5sums=("d9da609e2fb84c218db398f126ee5a1a")

package() {
    bsdtar -xf dcpl8410cdwlpr-1.5.0-0.i386.rpm -C "${pkgdir}" \
           opt/brother/Printers/dcpl8410cdw/inf \
           opt/brother/Printers/dcpl8410cdw/lpd/"${CARCH}" \
           opt/brother/Printers/dcpl8410cdw/lpd/filter_dcpl8410cdw

    mv "${pkgdir}"/opt/brother/Printers/dcpl8410cdw/lpd/"${CARCH}"/* \
       "${pkgdir}"/opt/brother/Printers/dcpl8410cdw/lpd/

    rmdir "${pkgdir}"/opt/brother/Printers/dcpl8410cdw/lpd/"${CARCH}"
}
