# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AdaptGauss
_pkgver=1.5.6
pkgname=r-${_pkgname,,}
pkgver=1.5.6
pkgrel=3
pkgdesc='Gaussian Mixture Models (GMM)'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-datavisualizations
  r-pracma
  r-rcpp
  r-shiny
)
optdepends=(
  r-dqrng
  r-foreach
  r-ggplot2
  r-grid
  r-knitr
  r-mclust
  r-paralleldist
  r-reshape2
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b07773123f9c2f63ae83066b48a9ac866ef7dd24dae292e024d82b72b195d21c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
