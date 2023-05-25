# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=treemap
_pkgver=2.4-4
pkgname=r-${_pkgname,,}
pkgver=2.4.4
pkgrel=1
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
sha256sums=('c55a8b271f16405a283978cd4e0bef7192840b397aa7bb6fbbf9233b875677c0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
