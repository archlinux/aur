# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSEABase
_pkgver=1.70.1
pkgname=r-${_pkgname,,}
pkgver=1.70.1
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
  r-runit
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('760d4f18355386691d7f56a5e8aded4ee40cc31092bd4433df6a451e3bce045b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
