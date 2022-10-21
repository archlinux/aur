# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gap
_pkgver=1.3-1
pkgname=r-${_pkgname,,}
pkgver=1.3.1
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
sha256sums=('8edf25300002e37e54c20e973d7a60d503785645d17f2127aa6072e338c7ccdc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
