# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNAmodR.AlkAnilineSeq
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
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
sha256sums=('644f187018998807f8a6d7ab6d3d94e2a1073a18d5372f884e88246d796d2ba6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
