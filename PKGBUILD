# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scHOT
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='single-cell higher order testing'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-ggforce
  r-ggplot2
  r-igraph
  r-iranges
  r-reshape
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-deldir
  r-knitr
  r-markdown
  r-matrixstats
  r-rmarkdown
  r-scales
  r-scater
  r-scattermore
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('77e4180f2f19c96354dc4a9e6caab9cfffe08f8681051c40bf3994f156c11317')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
