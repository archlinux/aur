# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cicero
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Precict cis-co-accessibility from single-cell chromatin accessibility data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-assertthat
  r-biobase
  r-biocgenerics
  r-data.table
  r-dplyr
  r-fnn
  r-genomicranges
  r-ggplot2
  r-glasso
  r-gviz
  r-igraph
  r-iranges
  r-monocle
  r-plyr
  r-reshape2
  r-s4vectors
  r-stringi
  r-stringr
  r-tibble
  r-tidyr
  r-vgam
)
optdepends=(
  r-annotationdbi
  r-covr
  r-knitr
  r-markdown
  r-rmarkdown
  r-rtracklayer
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c59b4a1cb65a373646d2ffc3574f390f87afc36ac5de540bbe856472781876a7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
