# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=backbone
_pkgver=2.1.0
pkgname=r-${_pkgname,,}
pkgver=2.1.0
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
sha256sums=('197af2f3efa37802592b9d607afd9aab5b108182bc36f672c19b4373de915a99')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
