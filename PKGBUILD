# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tripr
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='T-cell Receptor/Immunoglobulin Profiler (TRIP)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-config
  r-data.table
  r-dplyr
  r-dt
  r-golem
  r-gridextra
  r-plot3d
  r-plotly
  r-plyr
  r-rcolorbrewer
  r-shiny
  r-shinybs
  r-shinyfiles
  r-shinyjs
  r-stringdist
  r-stringr
)
optdepends=(
  r-biocgenerics
  r-biocmanager
  r-biocstyle
  r-biocthis
  r-biostrings
  r-fs
  r-knitr
  r-motifstack
  r-parallel
  r-pryr
  r-refmanager
  r-rlist
  r-rmarkdown
  r-shinycssloaders
  r-testthat
  r-tidyverse
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f626700f1d8eef5d1d53fb33b59bc91d166fa45515ac5b384d479bce61edc721')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
