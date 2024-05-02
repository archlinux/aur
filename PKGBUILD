# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=altcdfenvs
_pkgver=2.66.0
pkgname=r-${_pkgname,,}
pkgver=2.66.0
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
sha256sums=('8b6eec8c414583170d04d2cb968f6caba7981d61f570c6122b6f8fc4da906322')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
