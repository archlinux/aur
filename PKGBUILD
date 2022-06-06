# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinyhelper
_pkgver=0.3.2
pkgname=r-${_pkgname,,}
pkgver=0.3.2
pkgrel=4
pkgdesc="Easily Add Markdown Help Files to 'shiny' App Elements"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-markdown
  r-shiny
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f7ed62543ab4d05a34b69a9183517a09e93e1b2da85b113282de0f9982db90b0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
