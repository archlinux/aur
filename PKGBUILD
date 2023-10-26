# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=openPrimeRui
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
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
sha256sums=('34b6ea9cbdc6f65ee90984cabc1a0f928f0309a82e09e7d4354dc0fec98fd5ef')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
