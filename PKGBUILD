# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=transformGamPoi
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Variance Stabilizing Transformation for Gamma-Poisson Models'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-delayedarray
  r-glmgampoi
  r-hdf5array
  r-matrixgenerics
  r-rcpp
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-scran
  r-tenxpbmcdata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('35f5eda81439ad09923caf409ed35e7052394dbc69ddeecb19063fe0fb112d3f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
