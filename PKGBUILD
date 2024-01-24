# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SpatialDecon
_pkgver=1.12.3
pkgname=r-${_pkgname,,}
pkgver=1.12.3
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
sha256sums=('760bd0a4dc5d7ac43bbbb0984bb5fd41a42d44982519fbe54c5d047c4b72ca57')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
