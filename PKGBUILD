# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gap
_pkgver=1.5
pkgname=r-${_pkgname,,}
pkgver=1.5
pkgrel=1
pkgdesc='Genetic Analysis Package'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-gap.datasets
  r-dplyr
  r-ggplot2
  r-plotly
)
optdepends=(
  r-bdsmatrix
  r-bradleyterry2
  r-calibrate
  r-circlize
  r-coda
  r-cowplot
  r-coxme
  r-diagrammer
  r-dot
  r-foreign
  r-forestplot
  r-genetics
  r-grid
  r-haplo.stats
  r-htmlwidgets
  r-jsonlite
  r-kinship2
  r-knitr
  r-lattice
  r-magic
  r-manhattanly
  r-mass
  r-matrix
  r-matrixstats
  r-mcmcglmm
  r-meta
  r-metafor
  r-mets
  r-nlme
  r-pedigree
  r-pedigreemm
  r-plotrix
  r-r2jags
  r-readr
  r-reshape
  r-rmarkdown
  r-rmeta
  r-rms
  r-shiny
  r-survival
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0061e27c639bde5aedf58f4ffe42f890f36fe2166a0ce19484409383efd7f95b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
