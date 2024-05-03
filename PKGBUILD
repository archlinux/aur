# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=recountmethylation
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Access and analyze DNA methylation database compilations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-basilisk
  r-biocfilecache
  r-delayedmatrixstats
  r-hdf5array
  r-minfi
  r-r.utils
  r-rcurl
  r-reticulate
  r-rhdf5
  r-s4vectors
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-experimenthub
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-knitr
  r-limma
  r-minfidata
  r-minfidataepic
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5422fc5c88c6e3985c901a795465662ac75eaf7f9029b1f3e3b205683e0b7731')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
