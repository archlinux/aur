# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ttgsea
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
sha256sums=('fa1bd25f4f4c7a06c589cfe051ad064cbf0ecd3adfeaec83317ddfbf588e09c8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
