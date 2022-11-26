# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=densityClust
_pkgver=0.3.2
pkgname=r-${_pkgname,,}
pkgver=0.3.2
pkgrel=6
pkgdesc='Clustering by Fast Search and Find of Density Peaks'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fnn
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-rcolorbrewer
  r-rcpp
  r-rtsne
)
optdepends=(
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1a47b1384aeaf4734b5766567b1ce0fed221094813b91aad7879daf64374a217')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
