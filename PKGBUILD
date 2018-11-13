# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: wmax641 <spam at wmax641 dot website>
pkgname=brother-hl1218w
pkgver=3.0.1
pkgrel=1
pkgdesc="Brother HL-1218W CUPS driver. After installing this, install printer from CUPS web interface"
url="https://support.brother.com/g/b/downloadtop.aspx?c=cn&lang=zh&prod=hl1218w_cn"
license=('GPL')
arch=('i686' 'x86_64')
depends=('lib32-glibc' 'cups>=2.1.2' 'ghostscript' )
md5sums=('04bf0181c0bd3b343457efa142ba9851'
         'a265a4d1c96f59ad178c3c746f81bf98')
source=(
    https://download.brother.com/welcome/dlf102479/hl1218wlpr-3.0.1-1.i386.rpm
    https://download.brother.com/welcome/dlf102480/hl1218wcupswrapper-3.0.1-1.i386.rpm
)


package() {
   mkdir -p "$pkgdir/usr/share/cups/model/"
   mkdir -p "$pkgdir/usr/lib/cups/filter/"

   cp "$srcdir/opt/brother/Printers/HL1218W/cupswrapper/brother-HL1218W-cups-en.ppd" "$pkgdir/usr/share/cups/model/brother-HL1218W-cups-en.ppd"
   cp "$srcdir/opt/brother/Printers/HL1218W/cupswrapper/brother_lpdwrapper_HL1218W"  "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HL1218W"
   cp -r "$srcdir/opt/" "$pkgdir/opt/"

}

