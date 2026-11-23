# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aricode
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=1.1.0
pkgrel=1
pkgdesc='Efficient Computations of Standard Clustering Comparison Measures'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-lifecycle
  r-rcpp
)
optdepends=(
  r-ggplot2
  r-mclust
  r-pkgdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9a68d846fd14edb62fc90073083b547f5c8442f0d332fbda654cf9a03b0746f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
