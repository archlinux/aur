# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cliqueMS
_pkgver=1.12.2
pkgname=r-${_pkgname,,}
pkgver=1.12.2
pkgrel=1
pkgdesc='Annotation of Isotopes, Adducts and Fragmentation Adducts for in-Source LC/MS Metabolomics Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bh
  r-igraph
  r-matrixstats
  r-msnbase
  r-qlcmatrix
  r-rcpp
  r-rcpparmadillo
  r-xcms
  gcc
)
optdepends=(
  r-camera
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('df14949cc2147c3cacc09c584885fdfcbb8f58ce48f821d3a3fa5f229196668f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
