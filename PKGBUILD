# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BioNet
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=1.74.0
pkgrel=1
pkgdesc='Routines for the functional analysis of biological networks'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-graph
  r-igraph
  r-rbgl
)
optdepends=(
  r-all
  r-dlbcl
  r-genefilter
  r-hgu95av2.db
  r-impute
  r-limma
  r-rgl
  r-xml
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('67ba5845c3faaff2180ec5ad01c3eed68bd2033a2189b64fc07ee025298f952c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
