# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=oposSOM
_pkgver=2.14.0
pkgname=r-${_pkgname,,}
pkgver=2.14.0
pkgrel=1
pkgdesc='Comprehensive analysis of transcriptome data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-biobase
  r-biomart
  r-fastica
  r-fdrtool
  r-graph
  r-igraph
  r-pixmap
  r-png
  r-rcpp
  r-rcppparallel
  r-rcurl
  r-scatterplot3d
  r-tsne
  r-xml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ef2ed1adb171a170a69b5ff9a0b297c44495858a978d361a525f5cb4d4b7f439')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
