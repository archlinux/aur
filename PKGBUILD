# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splatter
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Simple Simulation of Single-cell RNA Sequencing Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-checkmate
  r-crayon
  r-edger
  r-fitdistrplus
  r-locfit
  r-matrixstats
  r-rlang
  r-s4vectors
  r-scuttle
  r-singlecellexperiment
  r-summarizedexperiment
  r-withr
)
optdepends=(
  r-basics
  r-biocmanager
  r-biocsingular
  r-biocstyle
  r-biostrings
  r-covr
  r-cowplot
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-igraph
  r-iranges
  r-knitr
  r-limsolve
  r-lme4
  r-magick
  r-mfa
  r-phenopath
  r-preprocesscore
  r-progress
  r-pscl
  r-rmarkdown
  r-scales
  r-scater
  r-scdd
  r-scran
  r-sparsedc
  r-spelling
  r-testthat
  r-variantannotation
  r-zinbwave
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('493e94ba39e6e33f5e60b16e59c5f69a2bf729d6bc6fd4e24a2bd23e2ca9bbba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
