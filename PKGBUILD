# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MAI
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
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
sha256sums=('d2d07d34c7f4042474b9ab06f3a3c0e7157d302bd08e4f73224d5ea57b7b9f3c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
