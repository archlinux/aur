# Maintainer: Wayne Jones waynej98 <at> gmail.com
# Contributor: Based on the Brother MFC-J6930DW update package
pkgname="brother-mfc-j6530dw"
pkgver="1.0.1"
pkgrel="0"
pkgdesc="Brother MFC-J6530DW CUPS driver."
url="http://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=mfcj6530dw_us_eu_as"
license=('GPL')
arch=('i686' 'x86_64')
depends=('lib32-glibc' 'lib32-libstdc++5' 'cups>=2.1.2' 'ghostscript' ) 
source=(
   "https://download.brother.com/welcome/dlf103007/mfcj6530dwlpr-1.0.1-0.i386.rpm"
   "https://download.brother.com/welcome/dlf103031/mfcj6530dwcupswrapper-1.0.1-0.i386.rpm"
)
md5sums=('51a985d64540af2e0df6343513eb72a6'
         '0f183df0e9e183d56f51fd3ae4a13299')

package() {
   mkdir -p "$pkgdir/usr/share/cups/model/"
   mkdir -p "$pkgdir/usr/lib/cups/filter/"

   ln -s "/opt/brother/Printers/mfcj6530dw/cupswrapper/brother_mfcj6530dw_printer_en.ppd" "$pkgdir/usr/share/cups/model/brother_mfcj6530dw_printer_en.ppd"
   ln -s "/opt/brother/Printers/mfcj6530dw/cupswrapper/brother_lpdwrapper_mfcj6530dw"  "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_mfcj6530dw"
   cp -r "$srcdir/opt/" "$pkgdir/opt/"
}
