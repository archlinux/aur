# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=isomiRs
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Analyze isomiRs and miRNAs from small RNA-seq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationdbi
  r-assertive.sets
  r-biobase
  r-biocgenerics
  r-broom
  r-cowplot
  r-degreport
  r-deseq2
  r-dplyr
  r-genomicranges
  r-ggally
  r-ggplot2
  r-gplots
  r-gridextra
  r-gtools
  r-iranges
  r-limma
  r-rcolorbrewer
  r-readr
  r-reshape
  r-rlang
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-org.mm.eg.db
  r-pheatmap
  r-rmarkdown
  r-targetscan.hs.eg.db
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b178dc33d335e92738e56c1691ed458a8391c994d4c7ef4a0e12b25a3dcfabfc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
