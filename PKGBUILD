# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DataVisualizations
_pkgver=1.3.2
pkgname=r-${_pkgname,,}
pkgver=1.3.2
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
  r-databionicswarm
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
  r-rworldmap
  r-signal
  r-vioplot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('192f2a8f9aee4dbf23f8471a07509b15b66c4d70240275d2ba4ab201ede31579')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
