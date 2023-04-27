# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=celaref
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Single-cell RNAseq cell cluster labelling by reference'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-delayedarray
  r-dplyr
  r-ggplot2
  r-magrittr
  r-mast
  r-readr
  r-rlang
  r-s4vectors
  r-summarizedexperiment
  r-tibble
)
optdepends=(
  r-experimenthub
  r-knitr
  r-limma
  r-parallel
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cf2f0d2df78bbc4ff50cec0c2e5a2d1c0820bb3324846615a51c38924fc9e23f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
