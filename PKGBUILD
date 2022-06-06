# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sojourner
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Statistical analysis of single molecule trajectories'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-dplyr
  r-ebimage
  r-fitdistrplus
  r-ggplot2
  r-gridextra
  r-mclust
  r-minpack.lm
  r-mixtools
  r-mltools
  r-nls2
  r-pixmap
  r-plyr
  r-r.matlab
  r-rcpp
  r-reshape2
  r-rlang
  r-sampsurf
  r-scales
  r-shiny
  r-shinyjs
  r-sp
  r-truncnorm
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8baadc0b80177bc303842116e3eb4cecb2ed07b50a1a4a0d91b8372f2138efa5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
