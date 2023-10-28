# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MAI
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Mechanism-Aware Imputation'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-caret
  r-doparallel
  r-e1071
  r-foreach
  r-future
  r-future.apply
  r-missforest
  r-pcamethods
  r-s4vectors
  r-summarizedexperiment
  r-tidyverse
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('47bc71e649cabb37f99e67d753f0e4c5d8ed80084a7ebe1504601e19a9e82a72')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
