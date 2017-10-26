# Maintainer: Richard Mathot <rim@odoo.com>
pkgname=brother-dcpl2560dw-cups
pkgver=3.2.0_1
pkgrel=1
pkgdesc="Brother DCP-L2560DW CUPS drivers."
arch=('any')
url="http://support.brother.com/g/b/downloadend.aspx?c=gb&lang=en&prod=dcpl2560dw_eu&os=127&dlid=dlf101766_000&flang=4&type3=560"
license=('GPL2' 'custom:brother')
depends=('brother-dcpl2560dw-lpr' 'cups')
optdepends=('brscan4: scanner support.')
source=("http://download.brother.com/welcome/dlf101766/dcpl2560dwcupswrapper-${pkgver/_/-}.i386.rpm")
md5sums=('15fa66efa16fb3a5b67554385dfe8d4d')

prepare() {
  sed -ie '47,53c my $basedir = "/opt/brother/Printers/DCPL2560DW";' \
    ${srcdir}/opt/brother/Printers/DCPL2560DW/cupswrapper/brother_lpdwrapper_DCPL2560DW

}

package() {
  mkdir -p ${pkgdir}/usr/share/cups/model
  mkdir -p ${pkgdir}/usr/lib/cups/filter
  mkdir -p ${pkgdir}/usr/lib32/cups/filter
  mkdir -p ${pkgdir}/usr/libexec/cups/filter
  cp ${srcdir}/opt/brother/Printers/DCPL2560DW/cupswrapper/brother-DCPL2560DW-cups-en.ppd ${pkgdir}/usr/share/cups/model
  cp ${srcdir}/opt/brother/Printers/DCPL2560DW/cupswrapper/brother_lpdwrapper_DCPL2560DW ${pkgdir}/usr/lib/cups/filter
  cp ${srcdir}/opt/brother/Printers/DCPL2560DW/cupswrapper/brother_lpdwrapper_DCPL2560DW ${pkgdir}/usr/lib32/cups/filter
  cp ${srcdir}/opt/brother/Printers/DCPL2560DW/cupswrapper/brother_lpdwrapper_DCPL2560DW ${pkgdir}/usr/libexec/cups/filter
}

