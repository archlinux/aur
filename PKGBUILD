# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=COCOA
_pkgver=2.18.0
pkgname=r-${_pkgname,,}
pkgver=2.18.0
pkgrel=1
pkgdesc='Coordinate Covariation Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-complexheatmap
  r-data.table
  r-fitdistrplus
  r-genomicranges
  r-ggplot2
  r-iranges
  r-mira
  r-s4vectors
  r-simplecache
  r-tidyr
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-knitr
  r-lola
  r-parallel
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c3fad12d6290bc5f9cadc4d706e7551aa72c9f8a910312e6f2fa8aab5f8e9029')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
