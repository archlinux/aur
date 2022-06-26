# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ropls
_pkgver=1.28.2
pkgname=r-${_pkgname,,}
pkgver=1.28.2
pkgrel=2
pkgdesc='PCA, PLS(-DA) and OPLS(-DA) for multivariate analysis and feature selection of omics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CeCILL')
depends=(
  r
  r-biobase
  r-multidataset
  r-multiassayexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-multtest
  r-omicade4
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ccc45171c1c25f88de4753da93d3ff70757eee17ced9cea3a47c30944be8f71d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
