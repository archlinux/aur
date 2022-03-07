# Contributor: Clint Valentine <valentine.clint@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=igvtools
_pkgname=IGVTools
pkgver=2.4.19
pkgrel=2
pkgdesc="IGV utilities for preprocessing bioinformatics data files"
arch=('any')
url="https://software.broadinstitute.org/software/igv"
license=('GPL2')
depends=('java-runtime' 'bash')
source=(
  http://data.broadinstitute.org/igv/projects/downloads/"${pkgver%.*}"/"${pkgname}"_"${pkgver}".zip
)
sha256sums=('7b351dde496ef9026b9da46f1962ce56b4a03ac04a212ddd59c3ba3caa9957c8')

package() {
  install -Dm775 "${srcdir}"/${_pkgname}_${pkgver}/"${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm775 "${srcdir}"/${_pkgname}_${pkgver}/"${pkgname}_gui" "${pkgdir}"/usr/bin/"${pkgname}"_gui
  install -Dm664 "${srcdir}"/${_pkgname}_${pkgver}/lib/"${pkgname}".jar \
	  "${pkgdir}"/usr/share/java/igv/"${pkgname}".jar
  install -Dm644 "${srcdir}"/${_pkgname}_${pkgver}/igvtools_readme.txt \
	  "${pkgdir}"/usr/share/doc/$pkgname/igvtools_readme.txt
}
