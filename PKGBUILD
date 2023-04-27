# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rexposome
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Exposome exploration and outcome data analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-circlize
  r-corrplot
  r-factominer
  r-ggplot2
  r-ggrepel
  r-glmnet
  r-gplots
  r-gridextra
  r-gtools
  r-hmisc
  r-imputelcmd
  r-lme4
  r-lsr
  r-mice
  r-pryr
  r-reshape2
  r-s4vectors
  r-scales
  r-scatterplot3d
  r-stringr
)
optdepends=(
  r-biocstyle
  r-flexmix
  r-knitr
  r-mclust
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7b1924746570ec50626d94aafab85afa2930bb2ef3fec18fc075c8fd3d1dec13')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
