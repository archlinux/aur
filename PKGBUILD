# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PanVizGenerator
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=4
pkgdesc='Generate PanViz visualisations from your pangenome'
arch=('any')
url="https://bioconductor.org/packages/3.14/bioc/html/PanVizGenerator.html"
license=('GPL')
depends=(
  r
  r-findmyfriends
  r-igraph
  r-jsonlite
  r-pcamethods
  r-shiny
)
optdepends=(
  r-biocstyle
  r-digest
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/3.14/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4d0ccdf162d78f8bf7bc676862b104b61c401682d999b001a02bb15998141d66')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
