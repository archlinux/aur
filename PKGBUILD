pkgname=brother-hll5210dn
pkgver=4.0.3
pkgrel=1
pkgdesc="LPR driver for Brother HL-L5210DN printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=ca&lang=en&prod=hll5210dn_us_eu_as"
license=("EULA")
depends=('cups' 'ghostscript')
depends_x86_64=('lib32-glibc')
source=("https://download.brother.com/welcome/dlf105803/hll5210dnpdrv-${pkgver}-1.i386.rpm")
md5sums=('c0a5cdef5e67ac2fef4145d5e50c121a')

package() {
  cp -R "$srcdir/opt" "$pkgdir/opt"
  ln -s "/opt/brother/Printers/HLL5210DN/lpd/$CARCH/brprintconflsr3" "$pkgdir/opt/brother/Printers/HLL5210DN/lpd/"
  ln -s "/opt/brother/Printers/HLL5210DN/lpd/$CARCH/rawtobr3" "$pkgdir/opt/brother/Printers/HLL5210DN/lpd/"

  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/opt/brother/Printers/HLL5210DN/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HLL5210DN"

  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/opt/brother/Printers/HLL5210DN/cupswrapper/brother-HLL5210DN-cups-en.ppd" "$pkgdir/usr/share/cups/model/"
}
