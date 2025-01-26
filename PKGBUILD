# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DataVisualizations
_pkgver=1.3.3
pkgname=r-${_pkgname,,}
pkgver=1.3.3
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
  r-rcpparmadillo
  r-reshape2
  r-sp
  gcc
)
optdepends=(
  r-abcanalysis
  r-choroplethr
  r-colorspace
  r-diptest
  r-dplyr
  r-ggextra
  r-ggmap
  r-ggrepel
  r-htmlwidgets
  r-knitr
  r-mass
  r-mba
  r-moments
  r-paralleldist
  r-plotly
  r-plotrix
  r-plyr
  r-r6
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
sha256sums=('b737db909b5650044852db0d6ac67bff207ed03a7952708c8dd704dda4d1bef3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
