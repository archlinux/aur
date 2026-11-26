# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ExploreModelMatrix
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
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
sha256sums=('e7814494e59eb942223f9ff366fe67b0135fc46b511af7afd1b841b0ffb818e4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
