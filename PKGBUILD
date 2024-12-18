# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=selectKSigs
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Selecting the number of mutational signatures using a perplexity-based measure and cross-validation'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-gtools
  r-hilda
  r-magrittr
  r-rcpp
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bd955e36641a6198ea28e0e94d583a48ec1894d00d532a21135a611ba6238b30')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
