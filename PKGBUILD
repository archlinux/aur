# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=backbone
_pkgver=2.1.3
pkgname=r-${_pkgname,,}
pkgver=2.1.3
pkgrel=1
pkgdesc='Extracts the Backbone from Graphs'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
  r-rcpp
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('60aa6fe26bc1483c4d2a6f153b876f457a880572e1fb5f17f73b9a12922ee9aa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
