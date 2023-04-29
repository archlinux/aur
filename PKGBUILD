# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PoTRA
_pkgver=1.13.0
pkgname=r-${_pkgname,,}
pkgver=1.13.0
pkgrel=4
pkgdesc='PoTRA: Pathways of Topological Rank Analysis'
arch=('any')
url="https://bioconductor.org/packages/3.16/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biocgenerics
  r-graph
  r-graphite
  r-igraph
  r-org.hs.eg.db
)
optdepends=(
  r-biocstyle
  r-colr
  r-knitr
  r-metap
  r-repmis
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4ed69460c06ead0bc014de665d9ca34cfc245bf3a3c0a17ebf44ac66796862a8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
