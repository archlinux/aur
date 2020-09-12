# Maintainer: Roman Schmocker (schmocker.roman at gmail)

pkgname=brother-hll2350dw
pkgver=4.0.0
pkgrel=2
pkgdesc="Brother HL-L2350DW CUPS driver"
arch=('i686' 'x86_64')
url="http://www.brother.com"
license=('custom')
arch=('i686' 'x86_64')
depends=('cups' 'ghostscript')
depends_x86_64=('lib32-glibc')

source=("http://download.brother.com/welcome/dlf103565/hll2350dwpdrv-4.0.0-1.i386.rpm")
sha512sums=('6f09adf26da9db35a45a540ae08fdf74cf00ca9edd98075a5a043003b84ae2c9c28e989c0e422bf7a6f2d6474600043150d6f23e5b3cdbf2687e525b0af67b42')

package(){
  cp -R "$srcdir/opt" "$pkgdir/opt"
  ln -s "/opt/brother/Printers/HLL2350DW/lpd/$CARCH/rawtobr3" "$pkgdir/opt/brother/Printers/HLL2350DW/lpd/rawtobr3"
  ln -s "/opt/brother/Printers/HLL2350DW/lpd/$CARCH/brprintconflsr3" "$pkgdir/opt/brother/Printers/HLL2350DW/lpd/brprintconflsr3"
    
  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/opt/brother/Printers/HLL2350DW/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HLL2350DW"

  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/opt/brother/Printers/HLL2350DW/cupswrapper/brother-HLL2350DW-cups-en.ppd" "$pkgdir/usr/share/cups/model"
  
  install -Dm644 "$srcdir/opt/brother/Printers/HLL2350DW/LICENSE_ENG.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"
  install -Dm644 "$srcdir/opt/brother/Printers/HLL2350DW/LICENSE_JPN.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_JPN.txt"
}
