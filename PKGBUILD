# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rBiopaxParser
_pkgver=2.40.0
pkgname=r-${_pkgname,,}
pkgver=2.40.0
pkgrel=1
pkgdesc='Parses BioPax files and represents them in R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-xml
)
optdepends=(
  r-biocgenerics
  r-graph
  r-igraph
  r-rbgl
  r-rcurl
  r-rgraphviz
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('846b5adddabf0d898d74b18f1c33b9f6c2107ca284a00e7c8811fce49c5eb0a6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
