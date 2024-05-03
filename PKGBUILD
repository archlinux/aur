# system requirements: bedtools (>= 2.28.0), Stereogene (>= v2.22), CapR(>= 1.1.1)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nearBynding
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Discern RNA structure proximal to protein binding'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-gplots
  r-magrittr
  r-matrixstats
  r-plyranges
  r-r.utils
  r-rlang
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-transport
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('43de63b2be23d53b72da33a0b8a9bc40528f566841f38ae203ecf3d56eac265a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
