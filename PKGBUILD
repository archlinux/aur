# Contributor: Clint Valentine <valentine.clint@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=igvtools
_pkgname=IGV
pkgver=2.13.2
pkgrel=1
pkgdesc="IGV utilities for preprocessing bioinformatics data files"
arch=('any')
url="https://software.broadinstitute.org/software/igv"
license=('MIT')
depends=('java-runtime>=11')
source=(
  ${pkgname}-${pkgver}.zip::https://data.broadinstitute.org/igv/projects/downloads/${pkgver%.*}/IGV_${pkgver}.zip
  "igvtools.sh"
  "igvtools_gui.sh"
)
sha256sums=('92ab783f693506cafc3499f014f63dce950534b0499e153853cde010a101c104'
            'd4cda10928d773dbc959a1cd5bb336aeecf95cb5e549b4560ba561c66f27c50a'
            '1bf610102219c0390d7d78e993110e1cdcb5aae571a79cfa54b093ee3c50ff7f')

package() {
  install -d "${pkgdir}"/usr/share/java/igv/
  cp -rf IGV_${pkgver}/lib/*  "${pkgdir}"/usr/share/java/igv/
  install -Dm644 "${srcdir}"/${_pkgname}_${pkgver}/igvtools_readme.txt \
	  "${pkgdir}"/usr/share/doc/$pkgname/igvtools_readme.txt
  install -Dm755 "igvtools.sh"  "${pkgdir}"/usr/bin/igvtools
  install -Dm755 "igvtools_gui.sh"  "${pkgdir}"/usr/bin/igvtools_gui
}
