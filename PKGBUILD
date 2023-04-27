# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNVgears
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='A Framework of Functions to Combine, Analize and Interpret CNVs Calling Results'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-ggplot2
)
optdepends=(
  r-biomart
  r-cn.mops
  r-cowplot
  r-delayedarray
  r-devtools
  r-evobir
  r-genomicranges
  r-knitr
  r-r.utils
  r-rmarkdown
  r-scales
  r-testthat
  r-usethis
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7d6be48cbd95fe83af70059b2c3797b97ac81d34a8c816f59d9f0d65e7efeddc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
