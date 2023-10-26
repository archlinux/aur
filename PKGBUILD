# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicDistributions
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='GenomicDistributions: fast analysis of genomic intervals with Bioconductor'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-biostrings
  r-broom
  r-data.table
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-plyr
  r-reshape2
  r-scales
)
optdepends=(
  r-annotationfilter
  r-biocstyle
  r-bsgenome
  r-ensembldb
  r-extrafont
  r-genomicdistributionsdata
  r-genomicfeatures
  r-knitr
  r-rmarkdown
  r-rtracklayer
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3dbff59d525a89e8707bc0e11c9a129db570c64c104a43812dc17155aa55d270')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
