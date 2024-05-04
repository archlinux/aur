# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=openPrimeRui
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Shiny Application for Multiplex PCR Primer Design and Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dt
  r-openprimer
  r-rmarkdown
  r-shiny
  r-shinybs
  r-shinyjs
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('caa5863773d55d40c90ec09ac14149ed2e84d9eb79790800a80a9cd58df20070')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
