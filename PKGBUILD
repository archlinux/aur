# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DiagrammeR
_pkgver=1.0.12
pkgname=r-${_pkgname,,}
pkgver=1.0.12
pkgrel=1
pkgdesc='Graph/Network Visualization'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-downloader
  r-dplyr
  r-glue
  r-htmltools
  r-htmlwidgets
  r-igraph
  r-magrittr
  r-purrr
  r-rcolorbrewer
  r-readr
  r-rlang
  r-rstudioapi
  r-scales
  r-stringr
  r-tibble
  r-tidyr
  r-viridis
  r-visnetwork
)
optdepends=(
  r-covr
  r-diagrammersvg
  r-knitr
  r-rmarkdown
  r-rsvg
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4205fbf908d8318cf652dbd57f13c5846b652bab02edbaf543ba97ed25e87e36')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
