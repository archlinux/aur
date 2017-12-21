# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=igvtools
pkgver=2.3.98
pkgrel=1
pkgdesc="IGV utilities for preprocessing data files"
arch=('any')
url="https://software.broadinstitute.org/software/igv"
license=('GPL2')
depends=('java-runtime-openjdk>=6')
provides=('igvtools')
conflicts=('igvtools')
source=(
  "http://data.broadinstitute.org/igv/projects/downloads/${pkgver%.*}/${pkgname}_${pkgver}.zip"
  "igvtools")
md5sums=(
  '17ed12a213cd9cdaeb2f2a5c56d84bc4'
  '17d307c9586921bccef9f7cb22b3e7ba')

package() {
  install -Dm775 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm664 "${srcdir}/IGVTools/${pkgname}.jar" "${pkgdir}/usr/share/java/igv/${pkgname}.jar"
  install -Dm644 "${srcdir}/IGVTools/igvtools_readme.txt" "${pkgdir}/usr/share/doc/${pkgname}-${pkgver%.*}/README.txt"
}
