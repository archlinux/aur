pkgname=ricoh-sp3700-ppds
pkgver=1.0
pkgrel=1
pkgdesc="PPD files for Ricoh's SP3700 multifunction printers, supplied by Ricoh"
arch=('any')
url='http://support.ricoh.com/bb/html/dr_ut_e/re1/model/sp320sn/sp320sn.htm'
license=('custom')
makedepends=(rpmextract)
depends=(cups ghostscript cups-filters)
source=('https://support.ricoh.com/w/bb/pub_j/dr_ut_d/4101038/4101038412/V102/5224415/sp_2300_3700p_pcl-1.02-0.noarch.rpm')
sha256sums=('f2a18b8232091ad490cfa0f5fc9826a193f6c0817ca26f2185113e951976e64b')

package() {
  install -d $pkgdir/usr/share/doc/Ricoh
  install -d $pkgdir/usr/share/cups/model/Ricoh
  install $srcdir/usr/share/cups/model/ricoh/*.xml $pkgdir/usr/share/doc/Ricoh/
  install $srcdir/usr/share/cups/model/ricoh/primax-gstopxl/* $pkgdir/usr/share/cups/model/Ricoh/
}
