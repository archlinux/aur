# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=target
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Predict Combined Function of Transcription Factors'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-genomicranges
  r-iranges
  r-matrixstats
  r-shiny
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-shinybs
  r-shinytest
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('01eb18035dcb30ebef4d32176bf2fdca5e814009410aaad73362a07b25bcb08c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
