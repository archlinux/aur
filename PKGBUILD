# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geva
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Gene Expression Variation Analysis (GEVA)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-dbscan
  r-fastcluster
  r-matrixstats
)
optdepends=(
  r-devtools
  r-knitr
  r-limma
  r-rmarkdown
  r-roxygen2
  r-testthat
  r-topgo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1269656ee03a41c6e1fbcf2027292eb2db03a6bb3e6d3315a32087c8ca7eec5d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
