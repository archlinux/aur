# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=motifStack
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=1
pkgdesc='Plot stacked logos for single or multiple DNA, RNA and amino acid sequence'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ade4
  r-biostrings
  r-ggplot2
  r-htmlwidgets
  r-xml
  r-tfbstools
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-cairo
  r-grimport
  r-grimport2
  r-jaspar2020
  r-knitr
  r-motifdb
  r-rcolorbrewer
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('51f45a9cc140a4b0f04d967b3024a72515f9c605a0ffa4552acd45ed27c71582')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
