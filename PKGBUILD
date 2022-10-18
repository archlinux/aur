# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=backbone
_pkgver=2.1.1
pkgname=r-${_pkgname,,}
pkgver=2.1.1
pkgrel=1
pkgdesc='Extracts the Backbone from Graphs'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
  r-network
  r-poissonbinomial
  r-rcpp
)
optdepends=(
  r-knitr
  r-mass
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0748ed4031739b793a9dcb39476848a0ef80049a66b86ea4facef3d12e0500ac')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
