# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=altcdfenvs
_pkgver=2.62.0
pkgname=r-${_pkgname,,}
pkgver=2.62.0
pkgrel=1
pkgdesc='alternative CDF environments (aka probeset mappings)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-biobase
  r-biocgenerics
  r-biostrings
  r-hypergraph
  r-makecdfenv
  r-s4vectors
)
optdepends=(
  r-hgu133a.db
  r-hgu133acdf
  r-hgu133aprobe
  r-hgu95acdf
  r-plasmodiumanophelescdf
  r-rcolorbrewer
  r-rgraphviz
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0b053c7e7bc3d97c13d79b205631b2b5cfce6aa67e0873af41bce59282acf1ca')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
