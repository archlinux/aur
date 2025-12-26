# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biocGraph
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=1.72.0
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
sha256sums=('ca4efbdeeda71e670200a3b2627d7b328ff391b20c0a0d139da25fb7f12c6c8d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
