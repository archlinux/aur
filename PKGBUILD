# Maintainer: Nissar Chababy <funilrys at outlook dot com>

pkgname=brother-mfct920dw
pkgver=3.5.0
pkgrel=2
pkgdesc="Brother MFC-T920DW CUPS driver"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="http://www.brother.com"
license=('custom')
depends=('cups' 'ghostscript')
depends_x86_64=('lib32-glibc')

source=("https://download.brother.com/welcome/dlf105186/mfct920dwpdrv-${pkgver}-1.i386.rpm")
sha512sums=('762042c93536606e2fe620b7a0e0eeb54215d962915c10f5a249a55f27681db6fbdba47b0031762947172a3368482da006d5af68ee426ff0188d3930aecefe76')
package(){
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -R "$srcdir/opt/brother/Printers/mfct920dw/." "${pkgdir}/usr/share/${pkgname}/"
    
  install -d "${pkgdir}/usr/lib/cups/filter/"
  ln -s "/usr/share/${pkgname}/cupswrapper/brother_lpdwrapper_mfct910dw" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_mfct920dw"

  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/usr/share/${pkgname}/cupswrapper/brother_mfct920dw_printer_en.ppd" "${pkgdir}/usr/share/cups/model"
  
  install -Dm644 "${pkgdir}/usr/share/${pkgname}/LICENSE_ENG.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"
  install -Dm644 "${pkgdir}/usr/share/${pkgname}/LICENSE_JPN.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_JPN.txt"
}
