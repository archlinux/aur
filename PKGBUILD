# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=heatmaply
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=1.3.0
pkgrel=3
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
sha256sums=('0a5d269c4837dd66fbfa6b87fd648bdef222f1ad6f33df3f695d5164d6f71ef1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
