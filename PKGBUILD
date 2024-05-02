# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=idpr
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Profiling and Analyzing Intrinsically Disordered Proteins in R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biostrings
  r-dplyr
  r-ggplot2
  r-jsonlite
  r-magrittr
  r-plyr
  r-rlang
)
optdepends=(
  r-ape
  r-knitr
  r-msa
  r-rmarkdown
  r-seqinr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e8583fa36082887a49e21ed94f2bbfc8f41aa5315bf0f131f994335b8c08cfbc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
