# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SpatialDecon
_pkgver=1.13.2
pkgname=r-${_pkgname,,}
pkgver=1.13.2
pkgrel=1
pkgdesc='Deconvolution of mixed cells from spatial and/or bulk gene expression data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-geomxtools
  r-lognormreg
  r-repmis
  r-seuratobject
)
optdepends=(
  r-knitr
  r-qpdf
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('735b0a12a37e3295f8e5ea298392d79a33e5ee72b03bbc27e4ea200913e13ed1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
