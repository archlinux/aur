# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ExploreModelMatrix
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Graphical Exploration of Design Matrices'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-cowplot
  r-dplyr
  r-dt
  r-ggplot2
  r-limma
  r-magrittr
  r-rintrojs
  r-s4vectors
  r-scales
  r-shiny
  r-shinydashboard
  r-shinyjs
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-htmltools
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2393bf9173e461093926df28a315d5b9eb067395bbbde1e3bf4774338160318c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
