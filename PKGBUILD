# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=selectKSigs
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
sha256sums=('26f008bb7dd789cb681e84a84c6e5bd9a18b8d9321885fbcc2b4489cbe278e50')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
