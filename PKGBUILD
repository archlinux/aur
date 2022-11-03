# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=altcdfenvs
_pkgver=2.60.0
pkgname=r-${_pkgname,,}
pkgver=2.60.0
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
sha256sums=('20a3a7adde7c53fadb977c5e1328ba57fd0903f3f9ff5378e0a15a2347a2a43a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
