# Contributor: killajoe <archlinux@kamprad.net>
# Maintainer: killajoe <archlinux@kamprad.net>

pkgname=brother-mfct910dw
pkgver=1.0.0
pkgrel=0
pkgdesc="Brother MFC-T910dw CUPS driver"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="http://www.brother.com"
license=('custom')
depends=('cups' 'ghostscript')
depends_x86_64=('lib32-glibc')

source=("https://download.brother.com/welcome/dlf103627/mfct910dwpdrv-1.0.0-0.i386.rpm")
sha512sums=('f4b8ba1b1e1ac90564c49140bf4e6c8d2e71c9dc0d9feeb5ddcc03c67771520e60e5e3666c34fbcdad33df21a10738827efe4eb24bdc75786abcda74bc81308c')
package(){
  cp -R "$srcdir/opt" "$pkgdir/opt"
    
  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/opt/brother/Printers/mfct910dw/cupswrapper/brother_lpdwrapper_mfct910dw" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_mfct910dw"

  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/opt/brother/Printers/mfct910dw/cupswrapper/brother_mfct910dw_printer_en.ppd" "$pkgdir/usr/share/cups/model"
  
  install -Dm644 "$srcdir/opt/brother/Printers/mfct910dw/LICENSE_ENG.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"
  install -Dm644 "$srcdir/opt/brother/Printers/mfct910dw/LICENSE_JPN.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_JPN.txt"
}

