# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splatter
_pkgver=1.22.1
pkgname=r-${_pkgname,,}
pkgver=1.22.1
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
  r-ggplot2
  r-locfit
  r-matrixstats
  r-s4vectors
  r-scales
  r-scater
  r-singlecellexperiment
  r-summarizedexperiment
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
  r-scdd
  r-scran
  r-scuttle
  r-sparsedc
  r-spelling
  r-testthat
  r-variantannotation
  r-zinbwave
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('08ee768f4d22582ac42807fdc5af0f35f9b4dd5e019ae3d822fc5bfd4b70bcc9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
