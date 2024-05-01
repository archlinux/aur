# system requirements: Rcpp
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pcaMethods
_pkgver=1.96.0
pkgname=r-${_pkgname,,}
pkgver=1.96.0
pkgrel=1
pkgdesc='A collection of PCA methods'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-rcpp
)
optdepends=(
  r-ggplot2
  r-lattice
  r-matrixstats
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f15662bdd30fa86cde65a7a2bc17cbc271a80cca4953133d2c89867c6b0738c3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
