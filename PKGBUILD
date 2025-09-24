# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sjmisc
_pkgver=2.8.11
pkgname=r-${_pkgname,,}
pkgver=2.8.11
pkgrel=1
pkgdesc='Data and Variable Transformation Functions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-insight
  r-magrittr
  r-purrr
  r-rlang
  r-sjlabelled
  r-tidyselect
)
optdepends=(
  r-ggplot2
  r-graphics
  r-haven
  r-knitr
  r-mice
  r-nnet
  r-rmarkdown
  r-sjplot
  r-sjstats
  r-stringdist
  r-testthat
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8ed1d6a2fb1555d62a8135465b2af0dbf2ea343010b4eafe817121cbb172152c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
