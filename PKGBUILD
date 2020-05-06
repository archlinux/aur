# Maintainer: Kiwwiaq

pkgname=brother-hlb2080dw
pkgver=4.0.0
pkgrel=1
pkgdesc="Brother HL-B2080DW CUPS driver"
arch=('i686' 'x86_64')
url="http://www.brother.com"
license=('custom')
arch=('i686' 'x86_64')
depends=('cups')
depends_x86_64=('lib32-glibc')

source=("https://download.brother.com/welcome/dlf103631/hlb2080dwpdrv-4.0.0-1.i386.rpm")
sha512sums=('75829ed24bada0f007c48067000f6ced7a65b48d92782ef6d25045cb66cf4654fd5208a5b4779802eda231e467132a782693f5756df027da3b119da2f09e2d3a')

package(){
  cp -R "$srcdir/opt" "$pkgdir/opt"
  ln -s "/opt/brother/Printers/HLB2080DW/lpd/$CARCH/rawtobr3" "$pkgdir/opt/brother/Printers/HLB2080DW/lpd/rawtobr3"
  ln -s "/opt/brother/Printers/HLB2080DW/lpd/$CARCH/brprintconflsr3" "$pkgdir/opt/brother/Printers/HLB2080DW/lpd/brprintconflsr3"
    
  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/opt/brother/Printers/HLB2080DW/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HLB2080DW"

  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/opt/brother/Printers/HLB2080DW/cupswrapper/brother-HLB2080DW-cups-en.ppd" "$pkgdir/usr/share/cups/model"
  
  install -Dm644 "$srcdir/opt/brother/Printers/HLB2080DW/LICENSE_ENG.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"
  install -Dm644 "$srcdir/opt/brother/Printers/HLB2080DW/LICENSE_JPN.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_JPN.txt"
}

