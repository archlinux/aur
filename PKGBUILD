# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metabCombiner
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Method for Combining LC-MS Metabolomics Feature Measurements'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-caret
  r-dplyr
  r-matrixstats
  r-rlang
  r-s4vectors
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('abd76a1d18aa4ce364aa7339df732475b0fa5e97c917092675d7ceeff002d0ee')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
