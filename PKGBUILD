# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cydar
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Using Mass Cytometry for Differential Abundance Analyses'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biocneighbors
  r-biocparallel
  r-flowcore
  r-rcpp
  r-s4vectors
  r-shiny
  r-singlecellexperiment
  r-summarizedexperiment
  r-viridis
  gcc
)
optdepends=(
  r-biocstyle
  r-edger
  r-flowstats
  r-glmnet
  r-knitr
  r-limma
  r-ncdfflow
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('12f64197f9ae44ac1178a94f1a4aaa3705ed8d426830a19aca2e1a83079bf391')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
