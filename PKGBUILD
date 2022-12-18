# system requirements: fftw3,libtiff,C++11,X11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=imager
_pkgver=0.42.15
pkgname=r-${_pkgname,,}
pkgver=0.42.15
pkgrel=1
pkgdesc="Image Processing Library Based on 'CImg'"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-downloader
  r-igraph
  r-jpeg
  r-magrittr
  r-png
  r-purrr
  r-rcpp
  r-readbitmap
  r-stringr
  fftw
  libtiff
  gcc
  xorg-server
)
optdepends=(
  r-cairo
  r-dplyr
  r-ggplot2
  r-knitr
  r-magick
  r-raster
  r-rmarkdown
  r-scales
  r-spatstat.geom
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('de1cd04a974d9b9bc021b8cb45bf3cf904665b184f3c8b6020aa21c8284e2199')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
