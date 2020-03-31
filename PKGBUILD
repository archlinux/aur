#!/usr/bin/bash
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=brother-mfc-j805dw
pkgver=1.0.5
pkgrel=2
pkgdesc="CUPS driver for Brother mfc-JX05DW(XL) printer"
arch=("i686" "x86_64")
depends_x86_64=('lib32-gcc-libs')
depends=('perl' 'bash' )
url="https://support.brother.com/g/b/faqtop.aspx?c=us&lang=en&prod=mfcj805dw_us"
license=("EULA")
source=("https://download.brother.com/welcome/dlf104569/mfcj805dwpdrv-1.0.5-0.i386.deb")
sha256sums=('f299b9674d5edb9c16b5fdbfd39d9ed6b6618f2a30ad942181180e59d3e7a68d')

package() {
       tar -xf data.tar.gz -C "${pkgdir}"

       install -m 755 -d $pkgdir/usr/share/ppd/Brother/
       ln -s /opt/brother/Printers/mfcj805dw/cupswrapper/brother_mfcj805dw_printer_en.ppd $pkgdir/usr/share/ppd/Brother/

       install -m 755 -d $pkgdir/usr/lib/cups/filter/
       ln -s /opt/brother/Printers/mfcj805dw/cupswrapper/brother_lpdwrapper_mfcj805dw $pkgdir/usr/lib/cups/filter/

       install -m 755 -d $pkgdir/usr/share/cups/Model/Brother/
       ln -s /opt/brother/Printers/mfcj805d/cupswrapper/brother_mfcj805dw_printer_en.ppd $pkgdir/usr/share/cups/Model/Brother/

       install -D $pkgdir/opt/brother/Printers/mfcj805dw/LICENSE_ENG.txt $pkgdir/usr/share/licenses/$pkgname
}


