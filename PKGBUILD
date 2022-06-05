# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=data.tree
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=1.0.0
pkgrel=4
pkgdesc='General Purpose Hierarchical Data Structure'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-r6
  r-stringi
)
optdepends=(
  r-ape
  r-diagrammer
  r-doparallel
  r-foreach
  r-formula
  r-graphics
  r-htmlwidgets
  r-igraph
  r-jsonlite
  r-knitr
  r-mockery
  r-networkd3
  r-party
  r-partykit
  r-rmarkdown
  r-rpart
  r-testthat
  r-treemap
  r-yaml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('40674c90a5bd00f5185db9adbd221c6f1114043e69095249f5fa8b3044af3f5e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
