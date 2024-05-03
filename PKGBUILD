# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ASICS
_pkgver=2.20.0
pkgname=r-${_pkgname,,}
pkgver=2.20.0
pkgrel=1
pkgdesc='Automatic Statistical Identification in Complex Spectra'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-ggplot2
  r-glmnet
  r-gridextra
  r-mvtnorm
  r-pepsnmr
  r-plyr
  r-quadprog
  r-ropls
  r-summarizedexperiment
  r-zoo
)
optdepends=(
  r-asicsdata
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('049b98d8cbff3c55a571f87350f3424512051fe8f10e526d9aa9c3b86a3f1cd3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
