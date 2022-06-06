# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VAExprs
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=1.2.1
pkgrel=3
pkgdesc='Generating Samples of Gene Expression Data with Variational Autoencoders'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-catencoders
  r-deeppincs
  r-diagrammer
  r-graddescent
  r-keras
  r-mclust
  r-purrr
  r-scater
  r-singlecellexperiment
  r-summarizedexperiment
  r-tensorflow
)
optdepends=(
  r-knitr
  r-reticulate
  r-rmarkdown
  r-sc3
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c1bc79af61481c21e8eb9bb5d8e676b55531d47e2b2ec8b5a7413de5bd9250a6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
