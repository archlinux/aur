# Maintainer: Kiwwiaq

pkgname=brother-hl-b2180dw
pkgver=4.1.0
pkgrel=2
pkgdesc="Brother HL-B2180DW CUPS driver"
arch=('i686' 'x86_64')
url="http://www.brother.com"
license=('custom')
arch=('i686' 'x86_64')
depends=('cups')
depends_x86_64=('lib32-glibc')

source=("https://download.brother.com/welcome/dlf105940/hlb2180dwpdrv-4.1.0-2.i386.rpm")
sha512sums=('80165b5d1d35ec4b92f5afc63dd2e030746546e0759dd3ae08a92e2c4fe0a992e7f52aacb03110fc5f8b8088c8be7974b3ec60abc4b0ed32fc5478c1f4c51a63')

package(){
  cp -R "$srcdir/opt" "$pkgdir/opt"
  ln -s "/opt/brother/Printers/HLB2180DW/lpd/$CARCH/rawtobr3" "$pkgdir/opt/brother/Printers/HLB2180DW/lpd/rawtobr3"
  ln -s "/opt/brother/Printers/HLB2180DW/lpd/$CARCH/brprintconflsr3" "$pkgdir/opt/brother/Printers/HLB2180DW/lpd/brprintconflsr3"

  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/opt/brother/Printers/HLB2180DW/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HLB2180DW"

  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/opt/brother/Printers/HLB2180DW/cupswrapper/brother-HLB2180DW-cups-en.ppd" "$pkgdir/usr/share/cups/model"

  install -Dm644 "$srcdir/opt/brother/Printers/HLB2180DW/LICENSE_ENG.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"
  install -Dm644 "$srcdir/opt/brother/Printers/HLB2180DW/LICENSE_JPN.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_JPN.txt"
}


