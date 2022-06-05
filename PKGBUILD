# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cellTree
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Inference and visualisation of Single-Cell RNA-seq data as a hierarchical tree structure'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-gplots
  r-igraph
  r-maptpx
  r-slam
  r-topgo
  r-topicmodels
  r-xtable
)
optdepends=(
  r-biobase
  r-biocstyle
  r-biomart
  r-hsmmsinglecell
  r-knitr
  r-org.hs.eg.db
  r-tools
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5b2d0029d1e8dd68a66e768963ef2328caa2b319096389d677d2b2457801ee7e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
