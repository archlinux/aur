# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=distinct
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
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
sha256sums=('145c8f7b1dc9427e4a6d9a6cd1f34d47ed6a75d21eb5e2a10cff03546748e53c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
