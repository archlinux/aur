# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cfDNAPro
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='cfDNAPro Helps Characterise and Visualise Whole Genome Sequencing Data from Liquid Biopsy'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-bsgenome.hsapiens.ncbi.grch38
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.hsapiens.ucsc.hg38
  r-dplyr
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-ggplot2
  r-iranges
  r-magrittr
  r-plyranges
  r-quantmod
  r-rlang
  r-rsamtools
  r-stringr
  r-tibble
)
optdepends=(
  r-biocstyle
  r-devtools
  r-ggpubr
  r-knitr
  r-rmarkdown
  r-scales
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f2cf246b77c6607d11745534b671759a17cd58720dc5a2986dfac7b43f64187f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
