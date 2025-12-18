# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinyBS
_pkgver=0.63.0
pkgname=r-${_pkgname,,}
pkgver=0.63.0
pkgrel=1
pkgdesc='Twitter Bootstrap Components for Shiny'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-htmltools
  r-shiny
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('710024cdacd5054e6c0cc4657f4d38d1afd1ce7315bccdd02e1df79176047b00')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
