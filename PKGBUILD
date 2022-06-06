# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSEAmining
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Make Biological Sense of Gene Set Enrichment Analysis Outputs'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dendextend
  r-dplyr
  r-ggplot2
  r-ggwordcloud
  r-gridextra
  r-rlang
  r-stringr
  r-tibble
  r-tidytext
)
optdepends=(
  r-biocstyle
  r-clusterprofiler
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2aa40edac34ea55506c864a687af9802271023b16e8a4b1c00246383c01029a7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
