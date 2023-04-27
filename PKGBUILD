# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=wpm
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
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
sha256sums=('f3dd229ba540498c80e3e01c67ee6e974eaeed95b57b6d7fad7c69dd3174d17f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
