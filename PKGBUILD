# Maintainer: krant <aleksey.vasilenko@gmail.com>

pkgname=xerox-phaser-3020
pkgver=1.00.25
pkgrel=0
pkgdesc="Driver for the Xerox Phaser 3020"
url="https://www.support.xerox.com/support/phaser-3020"
license=('custom')
arch=('x86_64')
depends=('libusb-compat' 'cups' 'ghostscript')
source=("http://download.support.xerox.com/pub/drivers/3020/drivers/linux/en_GB/Xerox_Phaser_3020_Linux-Driver.tar.gz")
md5sums=('86b8422bcd5be598f48a608fdbfeb2f1')

package() {
  mkdir -p "$pkgdir"/usr/lib
  cp "$srcdir"/uld/x86_64/libscmssc.so "$pkgdir"/usr/lib

  mkdir -p "$pkgdir"/usr/lib/cups/backend
  cp "$srcdir"/uld/x86_64/smfpnetdiscovery "$pkgdir"/usr/lib/cups/backend

  mkdir -p "$pkgdir"/usr/lib/cups/filter
  cp "$srcdir"/uld/x86_64/pstosecps   "$pkgdir"/usr/lib/cups/filter
  cp "$srcdir"/uld/x86_64/rastertospl "$pkgdir"/usr/lib/cups/filter

  mkdir -p "$pkgdir"/usr/share/ppd/xerox
  cp "$srcdir"/uld/noarch/share/ppd/Xerox_Phaser_3020.ppd "$pkgdir"/usr/share/ppd/xerox

  mkdir -p "$pkgdir"/usr/share/ppd/xerox/cms
  cp "$srcdir"/uld/noarch/share/ppd/cms/PH3020sc.cts "$pkgdir"/usr/share/ppd/xerox/cms
}
