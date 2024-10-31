# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DeepPINCS
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Protein Interactions and Networks with Compounds based on Sequences using Deep Learning'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-catencoders
  r-keras
  r-matlab
  r-prroc
  r-purrr
  r-rcdk
  r-reticulate
  r-stringdist
  r-tensorflow
  r-tokenizers
  r-ttgsea
  r-webchem
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c73581d264c99b3281cfeac13ff07cc9ad8d1643f786b96c7097f254bae4826e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
