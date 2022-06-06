# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=transformGamPoi
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=1
pkgdesc='Variance Stabilizing Transformation for Gamma-Poisson Models'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-delayedarray
  r-glmgampoi
  r-hdf5array
  r-matrixgenerics
  r-summarizedexperiment
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-scran
  r-tenxpbmcdata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d8ab0eac519ec917d09328e49aeb9d04c481a4e2caa21d1dfd8460e789288259')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
