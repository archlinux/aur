# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=maser
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Mapping Alternative Splicing Events to pRoteins'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocgenerics
  r-data.table
  r-dplyr
  r-dt
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-gviz
  r-iranges
  r-reshape2
  r-rtracklayer
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8a15d3f9f5883439ad2e9c6b89ad83bb20672e0667d5fa7ae4ec695f0c6dc270')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
