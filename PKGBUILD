# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=heatmaply
_pkgver=1.4.2
pkgname=r-${_pkgname,,}
pkgver=1.4.2
pkgrel=1
pkgdesc="Interactive Cluster Heat Maps Using 'plotly' and 'ggplot2'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-colorspace
  r-dendextend
  r-egg
  r-ggplot2
  r-htmlwidgets
  r-magrittr
  r-plotly
  r-rcolorbrewer
  r-reshape2
  r-scales
  r-seriation
  r-viridis
  r-webshot
)
optdepends=(
  r-covr
  r-gplots
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidyselect
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8a92b1ccee11371467f30833255c9ebef2259b6cbdf489181a0adac056c5ea7d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
