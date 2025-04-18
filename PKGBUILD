# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biocGraph
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=1.70.0
pkgrel=1
pkgdesc='Graph examples and use cases in Bioinformatics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-geneplotter
  r-graph
  r-rgraphviz
)
optdepends=(
  r-fibroeset
  r-geneplotter
  r-hgu95av2.db
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b3028ad8b9d3ec0ba1aa3eb64d6ff7003998284d36fefb1eb061e9ecc9ebc747')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
