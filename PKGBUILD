# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ddpcr
_pkgver=1.15
pkgname=r-${_pkgname,,}
pkgver=1.15
pkgrel=4
pkgdesc='Analysis and Visualization of Droplet Digital PCR in R and on the Web'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-dplyr
  r-dt
  r-ggplot2
  r-lazyeval
  r-magrittr
  r-mixtools
  r-plyr
  r-readr
  r-shiny
  r-shinyjs
  r-tibble
)
optdepends=(
  r-ggextra
  r-graphics
  r-grid
  r-gridextra
  r-knitr
  r-rmarkdown
  r-stats
  r-testthat
  r-utils
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9ad78906d8aec5ca0f57f403d15a2f09e913a726686515cd4b1d8fa7a6990213')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
