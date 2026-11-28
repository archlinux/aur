# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DataVisualizations
_pkgver=1.5.0
pkgname=r-${_pkgname,,}
pkgver=1.5.0
pkgrel=1
pkgdesc='Visualizations of High-Dimensional Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-pracma
  r-rcpp
  r-rcppparallel
  r-reshape2
  r-sp
  gcc
)
optdepends=(
  r-abcanalysis
  r-colorspace
  r-diptest
  r-ggextra
  r-ggmap
  r-ggrepel
  r-gridextra
  r-htmlwidgets
  r-knitr
  r-mass
  r-mba
  r-moments
  r-paralleldist
  r-plotly
  r-plotrix
  r-plyr
  r-rgl
  r-rmarkdown
  r-rocit
  r-rworldmap
  r-scatterdensity
  r-signal
  r-vioplot
  r-viridis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('79f5553d080f6aa0ee7ab33104d1ee692f849b6aaeb09579f0234478276528a2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
