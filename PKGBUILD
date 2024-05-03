# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VAExprs
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Generating Samples of Gene Expression Data with Variational Autoencoders'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-catencoders
  r-deeppincs
  r-diagrammer
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
sha256sums=('7d3118d071a258713ba6cbdf373d825e0993851ffaba1ea41dec4aac3b808d55')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
