# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SOMbrero
_pkgver=1.4-1
pkgname=r-${_pkgname,,}
pkgver=1.4.1
pkgrel=3
pkgdesc='SOM Bound to Realize Euclidean and Relational Outputs'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-ggwordcloud
  r-igraph
  r-interp
  r-markdown
  r-metr
  r-scatterplot3d
  r-shiny
)
optdepends=(
  r-hexbin
  r-knitr
  r-rmarkdown
  r-shinybs
  r-shinycssloaders
  r-shinyjqui
  r-shinyjs
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e2b2364da9f68dd34ed7190138b5f5d8c34fe9f8fdd8be3f151f1e0372473c2d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
