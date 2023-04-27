# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSEABase
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=1.62.0
pkgrel=1
pkgdesc='Gene set enrichment data structures and methods'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotate
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-graph
  r-xml
)
optdepends=(
  r-biocstyle
  r-go.db
  r-hgu95av2.db
  r-knitr
  r-org.hs.eg.db
  r-reportingtools
  r-rgraphviz
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d04a0c08e1321717d67b9ce633a5edaea40e8925b77e1596e69333faf47ecc75')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
