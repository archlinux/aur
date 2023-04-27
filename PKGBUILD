# system requirements: Python (>= 3.5.0), hic-straw
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=idr2d
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Irreproducible Discovery Rate for Genomic Interactions Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-dplyr
  r-futile.logger
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-idr
  r-iranges
  r-magrittr
  r-reticulate
  r-scales
  r-stringr
  python
)
optdepends=(
  r-dt
  r-htmltools
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('16e20558623450c7b5867308d76ba9f253434bd632eab5bbe7a9dfcc381dd246')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
