# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CSSQ
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Chip-seq Signal Quantifier Pipeline'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-iranges
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('08a3f629cec96411995cc37e5a66330a02ea531581429cd26482ea46d89ec370')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
