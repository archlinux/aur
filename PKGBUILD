# Maintainer: Maxime Aubry <max@champagne-aubry.com>
pkgname="brother-mfc-j6947dw"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Brother MFC-J6947DW CUPS driver."
url="https://support.brother.com/g/b/downloadtop.aspx?c=gb&lang=en&prod=mfcj6947dw_eu"
license=('GPL')
arch=('i686' 'x86_64')
depends=('cups' 'ghostscript' 'psutils' 'sed' 'grep' 'file')
depends_x86_64=('lib32-gcc-libs')
source=(
  "https://download.brother.com/pub/com/linux/linux/packages/mfcj6947dwpdrv-1.0.0-0.i386.rpm"
)
md5sums=(
  '1297cceab28ba128ff04a6f642f07952'
)

package() {
  mkdir -p "$pkgdir/usr/share/cups/model/"
  mkdir -p "$pkgdir/usr/lib/cups/filter/"
  mkdir -p "$pkgdir/usr/bin"

  ln -s "/opt/brother/Printers/mfcj6947dw/cupswrapper/brother_mfcj6947dw_printer_en.ppd" "$pkgdir/usr/share/cups/model/brother_mfcj6947dw_printer_en.ppd"
  ln -s "/opt/brother/Printers/mfcj6947dw/cupswrapper/brother_lpdwrapper_mfcj6947dw" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_mfcj6947dw"
  cp -r "$srcdir/opt/" "$pkgdir/opt/"
  cp "$srcdir/usr/bin/brprintconf_mfcj6947dw" "$pkgdir/usr/bin/"
}

