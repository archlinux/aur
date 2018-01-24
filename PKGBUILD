# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=igvtools
pkgver=2.3.98
pkgrel=2
pkgdesc="IGV utilities for preprocessing bioinformatics data files"
arch=('any')
url="https://software.broadinstitute.org/software/igv"
license=('GPL2')
depends=('java-runtime-openjdk>=6')
source=(
  igvtools.sh
  http://data.broadinstitute.org/igv/projects/downloads/"${pkgver%.*}"/"${pkgname}"_"${pkgver}".zip
)
sha256sums=(
  'e6a4ff3026b6cb7f86e9417d5232834d9d48d224ec6113f04d5f596258660dce'
  '07027c179f25960bab9919f255c0f8e08f0861861ac6dc02d92be8313e0316a4'
)

package() {
  install -Dm775 "${srcdir}"/"${pkgname}".sh "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm664 "${srcdir}"/IGVTools/"${pkgname}".jar "${pkgdir}"/usr/share/java/igv/"${pkgname}".jar
  install -Dm644 "${srcdir}"/IGVTools/igvtools_readme.txt "${pkgdir}"/usr/share/doc/"${pkgname}"-"${pkgver%.*}"/README.txt
}
