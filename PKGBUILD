# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TnT
_pkgver=1.26.2
pkgname=r-${_pkgname,,}
pkgver=1.26.2
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
sha256sums=('609f51f0956f38155b9879161a5431d6ae65546445da0526fece4292290cca47')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
