# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sjmisc
_pkgver=2.8.10
pkgname=r-${_pkgname,,}
pkgver=2.8.10
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
sha256sums=('2d64ab3551e6ac5993ade0dd269619063018decaa2fd34d56a2541209052c58b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
