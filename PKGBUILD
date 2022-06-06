# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phenopath
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Genomic trajectories with heterogeneous genetic and environmental backgrounds'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Apache')
depends=(
  r
  r-dplyr
  r-ggplot2
  r-rcpp
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-forcats
  r-knitr
  r-rmarkdown
  r-singlecellexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('22bbd4d53f3421752bb34e48933ceb840e284c8f823ee9df4a0817e02b489b84')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
