# Maintainer: erickpires <pires at erickpires dot com>
pkgname="brother-hl1200"
pkgver="3.0.1"
pkgrel="1"
pkgdesc="Brother HL-1200 CUPS driver (based on the HL-1210W driver package). After installing this, connect the printer and install it from CUPS web interface (default localhost:631)"
url="http://support.brother.com/g/b/downloadlist.aspx?c=us_ot&lang=en&prod=hl1202_us&os=127"
license=('GPL')
arch=('i686' 'x86_64')
depends=('lib32-glibc' 'cups>=2.1.2' )
md5sums=('de895b93a9cdb562c5b8be633ae6c0ad'
         '79a5b0119985bc89c6dc16dfee6e9c1b')
source=(
   http://download.brother.com/welcome/dlf101869/hl1200lpr-3.0.1-1.i386.rpm \
   http://download.brother.com/welcome/dlf101870/hl1200cupswrapper-3.0.1-1.i386.rpm
)




package() {
   mkdir -p "$pkgdir/usr/share/cups/model/"
   mkdir -p "$pkgdir/usr/lib/cups/filter/"

   cp "$srcdir/opt/brother/Printers/HL1200/cupswrapper/brother-HL1200-cups-en.ppd" "$pkgdir/usr/share/cups/model/brother-HL1200-cups-en.ppd"
   cp "$srcdir/opt/brother/Printers/HL1200/cupswrapper/brother_lpdwrapper_HL1200"  "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HL1200"
   cp -r "$srcdir/opt/" "$pkgdir/opt/"

}

