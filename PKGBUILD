# Maintainer: Leo von Klenze <devel@leo-von-klenze.de>
pkgname="brother-mfc-j6930dw"
pkgver="1.0.1"
pkgrel="1"
pkgdesc="Brother MFC-J6930DW CUPS driver."
url="http://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=mfcj6930dw_us_eu_as"
license=('GPL')
arch=('i686' 'x86_64')
depends=('lib32-glibc' 'cups>=2.1.2' 'ghostscript' ) 
source=(
   "http://download.brother.com/welcome/dlf103009/mfcj6930dwlpr-1.0.1-0.i386.rpm"
   "http://download.brother.com/welcome/dlf103033/mfcj6930dwcupswrapper-1.0.1-0.i386.rpm"
)
md5sums=('0a9a2979f43f6caba588a28f7d07acf5'
         '35dd11ffaace807a01ef66f70499f7d3')

package() {
   mkdir -p "$pkgdir/usr/share/cups/model/"
   mkdir -p "$pkgdir/usr/lib/cups/filter/"

   ln -s "/opt/brother/Printers/mfcj6930dw/cupswrapper/brother_mfcj6930dw_printer_en.ppd" "$pkgdir/usr/share/cups/model/brother_mfcj6930dw_printer_en.ppd"
   ln -s "/opt/brother/Printers/mfcj6930dw/cupswrapper/brother_lpdwrapper_mfcj6930dw"  "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_mfcj6930dw"
   cp -r "$srcdir/opt/" "$pkgdir/opt/"
}

