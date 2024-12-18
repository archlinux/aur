# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=YAPSA
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Yet Another Package for Signature Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-bsgenome.hsapiens.ucsc.hg19
  r-circlize
  r-complexheatmap
  r-corrplot
  r-dendextend
  r-doparallel
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-getoptlong
  r-ggbeeswarm
  r-ggplot2
  r-gridextra
  r-gtrellis
  r-keggrest
  r-limsolve
  r-magrittr
  r-pmcmrplus
  r-pracma
  r-reshape2
  r-somaticsignatures
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e5c3243eb4446373749c9ad7534b122a3567d8771990b6fffee52ab20d9088f9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
