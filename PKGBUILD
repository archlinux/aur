# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNAmodR.AlkAnilineSeq
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Detection of m7G, m3C and D modification by AlkAnilineSeq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-genomicranges
  r-gviz
  r-iranges
  r-rnamodr
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-biostrings
  r-knitr
  r-rmarkdown
  r-rnamodr.data
  r-rtracklayer
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b533dcd90bfa9cbb61a7651243911661dddd81233e40e482cc4dfd8efc50eab3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
