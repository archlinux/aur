# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TnT
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Interactive Visualization for Genomic Features'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-biobase
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-htmlwidgets
  r-iranges
  r-jsonlite
  r-knitr
  r-s4vectors
)
optdepends=(
  r-biocmanager
  r-genomicfeatures
  r-rmarkdown
  r-shiny
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4bf73650184f1978af55b1f0ee1102606e0e0c3113c633eb54853d2123b80ae3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
