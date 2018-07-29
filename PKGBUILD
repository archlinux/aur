# Maintainer: wmax641 <spam at wmax641 dot website>
pkgname="brother-hl1210w"
pkgver="3.0.1"
pkgrel="2"
pkgdesc="Brother HL-1210W CUPS driver. After installing this, install printer from CUPS web interface"
url="http://support.brother.com/g/b/downloadtop.aspx?c=au&lang=en&prod=hl1210w_eu_as"
license=('GPL')
arch=('i686' 'x86_64')
depends=('lib32-glibc' 'cups>=2.1.2' 'ghostscript' )
md5sums=('76db4e113a1186f86410146b2ea39166'
         '0d7c2ba3a1a30b5babd855efac48b1fb')
source=(
   http://download.brother.com/welcome/dlf101549/hl1210wlpr-3.0.1-1.i386.rpm \
   http://download.brother.com/welcome/dlf101548/hl1210wcupswrapper-3.0.1-1.i386.rpm
)


package() {
   mkdir -p "$pkgdir/usr/share/cups/model/"
   mkdir -p "$pkgdir/usr/lib/cups/filter/"

   cp "$srcdir/opt/brother/Printers/HL1210W/cupswrapper/brother-HL1210W-cups-en.ppd" "$pkgdir/usr/share/cups/model/brother-HL1210W-cups-en.ppd"
   cp "$srcdir/opt/brother/Printers/HL1210W/cupswrapper/brother_lpdwrapper_HL1210W"  "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HL1210W"
   cp -r "$srcdir/opt/" "$pkgdir/opt/"

}

