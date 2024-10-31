# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ttgsea
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Tokenizing Text of Gene Set Enrichment Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-data.table
  r-diagrammer
  r-keras
  r-purrr
  r-stopwords
  r-text2vec
  r-textstem
  r-tm
  r-tokenizers
)
optdepends=(
  r-fgsea
  r-knitr
  r-reticulate
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ab4b8ff040b6fa4290aad55ae9786c3dc08a85224b149aa807d3e40d28cd4821')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
