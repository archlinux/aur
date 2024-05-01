# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=synlet
_pkgver=2.4.0
pkgname=r-${_pkgname,,}
pkgver=2.4.0
pkgrel=1
pkgdesc='Hits Selection for Synthetic Lethal RNAi Screen Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-ggplot2
  r-magrittr
  r-patchwork
  r-rankprod
  r-rcolorbrewer
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e4111406e8678848e0c7d530b997d58a5e8f4a12dd7cd8ca0cc76ee5b0a8d859')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
