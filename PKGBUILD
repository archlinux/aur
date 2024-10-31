# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MetCirc
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Navigating mass spectral similarity in high-resolution MS/MS metabolomics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-amap
  r-circlize
  r-ggplot2
  r-mscoreutils
  r-s4vectors
  r-scales
  r-shiny
  r-spectra
)
optdepends=(
  r-biocgenerics
  r-graphics
  r-grdevices
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('de2341e3a8ae5659ab557fcc67bf77ad2d2335e702f0dd9698c7d6ae3529f6fd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
