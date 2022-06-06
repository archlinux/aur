# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=treemap
_pkgver=2.4-3
pkgname=r-${_pkgname,,}
pkgver=2.4.3
pkgrel=4
pkgdesc='Treemap Visualization'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-colorspace
  r-data.table
  r-ggplot2
  r-gridbase
  r-igraph
  r-rcolorbrewer
  r-shiny
)
optdepends=(
  r-knitr
  r-markdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('040f9f104f70e22097bd71636e2a7568b39da3e8592d31acaea7a3c19f7fe8b9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
