# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=motifStack
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
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
sha256sums=('dd1265381615f33e8c16cd1a17adac908e1c0c84e1e94f5848e49eb9e5037b72')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
