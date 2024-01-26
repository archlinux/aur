# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SOMbrero
_pkgver=1.4-2
pkgname=r-${_pkgname,,}
pkgver=1.4.2
pkgrel=1
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
sha256sums=('f652dabe8a1ff8e1da50723059e8195b64cfb6a64849b448331873ae066f7c95')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
