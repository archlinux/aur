# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cydar
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
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
sha256sums=('dbd62e9d791b4a82aba5670ad3938e645f4f4e01915b053c8167b5bd622b6e75')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
