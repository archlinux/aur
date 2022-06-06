# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=wpm
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Well Plate Maker'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-cli
  r-config
  r-dplyr
  r-dt
  r-ggplot2
  r-golem
  r-logging
  r-rcolorbrewer
  r-rlang
  r-shiny
  r-shinycustomloader
  r-shinydashboard
  r-shinywidgets
  r-stringr
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-msnbase
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('58b2f02f9a4f09969c11cff30c801edcfef7dd7f99887cd8d9d6f7df83d36389')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
