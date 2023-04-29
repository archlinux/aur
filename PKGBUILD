# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cellTree
_pkgver=1.27.0
pkgname=r-${_pkgname,,}
pkgver=1.27.0
pkgrel=4
pkgdesc='Inference and visualisation of Single-Cell RNA-seq data as a hierarchical tree structure'
arch=('any')
url="https://bioconductor.org/packages/3.16/${_pkgname}"
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
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4b27bcd2d0384d927ba8655537edf973c98c3bc381ef3b671c40b6c55c2ad979')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
