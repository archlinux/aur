# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=csdR
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Differential gene co-expression'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-glue
  r-matrixstats
  r-rcpp
  r-rhpcblasctl
  r-wgcna
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-igraph
  r-knitr
  r-magrittr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dc8545ceed9a327d13401ffca32a0b63e6d1111cc6a101370b1f84e273b9b1af')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
