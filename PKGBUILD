# Packaged by Christopher "ctag" Bero <chris at berocs dot com>
# Modified from brother-mfct920dw by Nissar Chababy <funilrys at outlook dot com>

# Note: I could only get printing to work by registering ipp://<ip>/ipp/port1.
# The auto-identified network address did not work for me.
# - ctag

pkgname=brother-mfc-t980dw
pkgver=3.6.1
pkgrel=1
pkgdesc="Caution, read PKGBUILD. Brother MFC-T980DW CUPS driver"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="http://www.brother.com"
license=('custom')
depends=('cups' 'ghostscript')
depends_x86_64=('lib32-glibc')

#source=("https://download.brother.com/welcome/dlf105186/mfct920dwpdrv-${pkgver}-1.i386.rpm")
source=("https://download.brother.com/welcome/dlf107058/mfct980dwpdrv-3.6.1-1.x86_64.rpm")
sha512sums=('e7fc4dc0ad12988da84960f3b70f9cc3c09af32515fee9d6b497cdcdd23c2f2963ed8547a6ffc44abcfeda72b9c224cd19e800f109337c81afc3d287c100d233')

package(){
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -R "$srcdir/opt/brother/Printers/mfct980dw/." "${pkgdir}/usr/share/${pkgname}/"
    
  install -d "${pkgdir}/usr/lib/cups/filter/"
  ln -s "/usr/share/${pkgname}/cupswrapper/brother_lpdwrapper_mfct980dw" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_mfct980dw"

  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/usr/share/${pkgname}/cupswrapper/brother_mfct980dw_printer_en.ppd" "${pkgdir}/usr/share/cups/model"
  
  install -Dm644 "${pkgdir}/usr/share/${pkgname}/LICENSE_ENG.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"
  install -Dm644 "${pkgdir}/usr/share/${pkgname}/LICENSE_JPN.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_JPN.txt"
}
