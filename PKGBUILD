# system requirements: C++11, Rtools (>= 3.1)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=QUBIC
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='An R package for qualitative biclustering in support of gene co-expression analyses'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
  r-biclust
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-fields
  r-knitr
  r-qgraph
  r-qubicdata
  r-rcolorbrewer
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('349275c7b02c27e8ab0dd724b39fe2f88e0e6000fd3a84d1e151d350f0f17774')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
