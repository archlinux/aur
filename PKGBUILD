# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=forestplot
_pkgver=3.2.0
pkgname=r-${_pkgname,,}
pkgver=3.2.0
pkgrel=1
pkgdesc="Advanced Forest Plot Using 'grid' Graphics"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-checkmate
)
optdepends=(
  r-dplyr
  r-gmisc
  r-greg
  r-knitr
  r-purrr
  r-rlang
  r-rmarkdown
  r-rmeta
  r-rms
  r-testthat
  r-tibble
  r-tidyr
  r-tidyselect
  r-tidyverse
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1f6e4795fb7411a1161494ab6f592e32044f45253bb6a2e02bbca4ac146102e7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
