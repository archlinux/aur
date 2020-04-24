# Maintainer: Michal Frackowiak <redbeard@openlabs.pl>
pkgname="brother-mfc-j6945dw"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Brother MFC-J6945DW CUPS driver."
url="http://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=mfcj6945dw_us_eu_as"
license=('GPL')
arch=('i686' 'x86_64')
depends=('cups' 'ghostscript' 'psutils' 'sed' 'grep' 'file')
depends_x86_64=('lib32-gcc-libs')
source=(
  "https://download.brother.com/welcome/dlf103889/mfcj6945dwpdrv-1.0.0-0.i386.rpm"
)
md5sums=(
  'a9d4b5a665fde94fe65be6826179ae13'
)

package() {
  mkdir -p "$pkgdir/usr/share/cups/model/"
  mkdir -p "$pkgdir/usr/lib/cups/filter/"
  mkdir -p "$pkgdir/usr/bin"

  ln -s "/opt/brother/Printers/mfcj6945dw/cupswrapper/brother_mfcj6945dw_printer_en.ppd" "$pkgdir/usr/share/cups/model/brother_mfcj6945dw_printer_en.ppd"
  ln -s "/opt/brother/Printers/mfcj6945dw/cupswrapper/brother_lpdwrapper_mfcj6945dw" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_mfcj6945dw"
  cp -r "$srcdir/opt/" "$pkgdir/opt/"
  cp "$srcdir/usr/bin/brprintconf_mfcj6945dw" "$pkgdir/usr/bin/"
}

