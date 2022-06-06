# system requirements: python (< 3.7), tensorflow
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scAlign
_pkgver=1.9.0
pkgname=r-${_pkgname,,}
pkgver=1.9.0
pkgrel=1
pkgdesc='An alignment and integration method for single cell genomics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-fnn
  r-ggplot2
  r-irlba
  r-purrr
  r-rtsne
  r-seurat
  r-singlecellexperiment
  r-tensorflow
  python
  tensorflow
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6dd70ff42fee440bd5a58d04955a1a3e907783f70fd44fac31961b50034b403c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
