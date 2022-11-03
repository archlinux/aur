# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=motifStack
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
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
  r-grimport
  r-grimport2
  r-knitr
  r-motifdb
  r-rcolorbrewer
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('153689805f2cd4ccf31ae8b909687aaf803532798f1d9586b7420f845be9eea1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
