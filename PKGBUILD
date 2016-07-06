# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=xerox-workcentre-78xx
pkgver=5.482.0.0
pkgrel=1
pkgdesc="Xerox WorkCentre 7830/7835/7845/7855 printer driver for CUPS"
arch=('i686' 'x86_64')
url="http://www.support.xerox.com/support/workcentre-7800-series/downloads/enus.html?associatedProduct=WorkCentre-78xx-built-in+controller&operatingSystem=linux"
license=('custom')
makedepends=('unrar')
source=("$pkgname.exe::http://download.support.xerox.com/pub/drivers/WC780XI/drivers/win10/ar/WC78XX_${pkgver}_PPD_English.exe"
        "LICENSE.txt")
sha256sums=('75ab5388dfe513732bd05cbaeb47196345ae26886d59c7d96b92749b6de08f9a'
            '2389b75bf45ba6f1329ad236110d7e1d496308cc484ee87b93c998a2573fd45b')

prepare() {
  unrar x "$pkgname.exe"
}

package() {
  install -Dm644 "xrx7830.ppd" "${pkgdir}/usr/share/ppd/xerox/xrx7830.ppd"
  install -Dm644 "xrx7835.ppd" "${pkgdir}/usr/share/ppd/xerox/xrx7835.ppd"
  install -Dm644 "xrx7845.ppd" "${pkgdir}/usr/share/ppd/xerox/xrx7845.ppd"
  install -Dm644 "xrx7855.ppd" "${pkgdir}/usr/share/ppd/xerox/xrx7855.ppd"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/xerox-workcentre-78xx/LICENSE.txt"
}
