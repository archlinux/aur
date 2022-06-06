# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gap
_pkgver=1.2.3-6
pkgname=r-${_pkgname,,}
pkgver=1.2.3.6
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
  r-dplyr
  r-foreign
  r-forestplot
  r-gap.datasets
  r-genetics
  r-ggplot2
  r-grid
  r-haplo.stats
  r-jsonlite
  r-kinship2
  r-lattice
  r-magic
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
  r-plotly
  r-plotrix
  r-r2jags
  r-reshape
  r-rmeta
  r-rms
  r-survival
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0ef352aa98a3bf27908b256f27a903058502176ea9112a4ffc41928ebbc48c22')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
