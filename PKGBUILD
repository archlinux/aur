# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GOSemSim
_pkgver=2.26.0
pkgname=r-${_pkgname,,}
pkgver=2.26.0
pkgrel=1
pkgdesc='GO-terms Semantic Similarity Measures'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-go.db
  r-rcpp
)
optdepends=(
  r-annotationhub
  r-biocmanager
  r-clusterprofiler
  r-dose
  r-knitr
  r-org.hs.eg.db
  r-prettydoc
  r-rmarkdown
  r-rocr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2a51bee583af0fd7b6fce9b62c719beeb1c4a565fafe83ef4ce5e6b5c937e8dd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
