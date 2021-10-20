# Contributor: Clint Valentine <valentine.clint@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=igvtools
pkgver=2.4.18
pkgrel=1
pkgdesc="IGV utilities for preprocessing bioinformatics data files"
arch=('any')
url="https://software.broadinstitute.org/software/igv"
license=('GPL2')
depends=('java-runtime' 'bash')
source=(
  igvtools.sh
  http://data.broadinstitute.org/igv/projects/downloads/"${pkgver%.*}"/"${pkgname}"_"${pkgver}".zip
)
sha256sums=('e6a4ff3026b6cb7f86e9417d5232834d9d48d224ec6113f04d5f596258660dce'
            '8236e31e4264e63e39956c1070028b83284a3fd56f46353504e47a12daa58dd2')

package() {
  install -Dm775 "${srcdir}"/"${pkgname}".sh "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm664 "${srcdir}"/IGVTools/lib/"${pkgname}".jar \
	  "${pkgdir}"/usr/share/java/igv/"${pkgname}".jar
  install -Dm644 "${srcdir}"/IGVTools/igvtools_readme.txt \
	  "${pkgdir}"/usr/share/doc/"${pkgname}"-"${pkgver%.*}"/README.txt
}
