# Maintainer: Janne Aho <aur@aho.hk>
pkgname="brother-hl-j6000dw"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Brother HL-J600DW CUPS driver."
url="https://support.brother.com/g/b/downloadtop.aspx?c=gb&lang=en&prod=hlj6000dw_eu"
license=('GPL')
arch=('i686' 'x86_64')
depends=('cups' 'ghostscript' 'psutils' 'sed' 'grep' 'file')
depends_x86_64=('lib32-gcc-libs' 'lib32-nss')
source=(
  "https://download.brother.com/pub/com/linux/linux/packages/hlj6000dwpdrv-1.0.0-0.i386.rpm"
)
md5sums=(
  '538ccf15961574ccab44db49630224be'
)

package() {
  mkdir -p "$pkgdir/usr/share/cups/model/"
  mkdir -p "$pkgdir/usr/lib/cups/filter/"
  mkdir -p "$pkgdir/usr/bin"

  ln -s "/opt/brother/Printers/hlj6000dw/cupswrapper/brother_hlj6000dw_printer_en.ppd" "$pkgdir/usr/share/cups/model/brother_hlj6000dw_printer_en.ppd"
  ln -s "/opt/brother/Printers/hlj6000dw/cupswrapper/brother_lpdwrapper_hlj6000dw" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_hlj6000dw"
  cp -r "$srcdir/opt/" "$pkgdir/opt/"
  cp "$srcdir/usr/bin/brprintconf_hlj6000dw" "$pkgdir/usr/bin/"
}
