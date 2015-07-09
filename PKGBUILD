# Maintainer: Nick Milosevic <nick000 at gmail dot com>
# Contributor: Dan McGee <dpmcgee@gmail.com>

pkgname=cups-xerox
pkgver=2008.01.23
pkgrel=1
pkgdesc="Drivers for various Xerox printers"
url="http://www.support.xerox.com/go/getfile.asp?objid=61334"
license=('custom')
install=${pkgname}.install
arch=('any')
depends=('cups')
source=('http://download.support.xerox.com/pub/drivers/DocuColor_2006/drivers/unix/en/LinuxCupsPrinterPkg.tar.gz'
        'cups-xerox.install'
        'LICENSE')

sha256sums=('066fb371a5f774a789ba60bf3e7a3f0149a147240fe5a43d9494752ef20cc67c'
            '7104a66782380ef7955f833b3c96f1948f5919541f3b00b6f1d219c4c5f6b6ee'
            '8f59224cc9f66afd77f54200f56f88b4d34b1516f415ca9888d0045b82bdf335')

package() {
  cd "${srcdir}"/LinuxCupsPrinterPkg
  
  # install all PPD's in a directory of their own
  mkdir -p "${pkgdir}"/usr/share/cups/model/Xerox
  install -m644 *.ppd "${pkgdir}"/usr/share/cups/model/Xerox

  # install the license file
  mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
