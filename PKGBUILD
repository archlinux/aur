# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ropls
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='PCA, PLS(-DA) and OPLS(-DA) for multivariate analysis and feature selection of omics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CeCILL')
depends=(
  r
  r-biobase
  r-ggplot2
  r-multiassayexperiment
  r-multidataset
  r-plotly
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
sha256sums=('fbdcde1abdf5169f549c645362c5f7fd2072a796f1913d320613ffab160b72cc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
