# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=distinct
_pkgver=1.10.2
pkgname=r-${_pkgname,,}
pkgver=1.10.2
pkgrel=1
pkgdesc='distinct: a method for differential analyses via hierarchical permutation tests'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-doparallel
  r-dorng
  r-foreach
  r-ggplot2
  r-limma
  r-rcpp
  r-rcpparmadillo
  r-scater
  r-singlecellexperiment
  r-summarizedexperiment
  r-rfast
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
  r-upsetr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('69af3d6027cfc79e944c7d2048d3950d28c00a208cd46c44da59a3252eb35aad')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
