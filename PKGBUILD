# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rScudo
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Signature-based Clustering for Diagnostic Purposes'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-igraph
  r-s4vectors
  r-stringr
  r-summarizedexperiment
)
optdepends=(
  r-all
  r-biocstyle
  r-caret
  r-doparallel
  r-e1071
  r-knitr
  r-parallel
  r-rcy3
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('79ca7ee5f6784d754ba074fffcd1bc8ec25f18000e8d14a047560639e87ed472')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
