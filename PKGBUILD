# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=motifStack
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
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
sha256sums=('72ea38e4e05695e4bb92433a6d0a61868a7856623f5f15026191bc0954f86497')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
