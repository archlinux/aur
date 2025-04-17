# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ttgsea
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
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
sha256sums=('f93ffc67e98eccdc819485c4fc750367c2cbe2c5fc0ec45387318f9c8a326499')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
