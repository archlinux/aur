# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=drawer
_pkgver=0.2.0.1
pkgname=r-${_pkgname,,}
pkgver=0.2.0.1
pkgrel=1
pkgdesc='An Interactive HTML Image Editing Tool'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bsplus
  r-glue
  r-htmltools
  r-magrittr
  r-shiny
  r-stringr
)
optdepends=(
  r-ggplot2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('05c2ea05c7c8780e30fa6f036033894b162b41917ce0e00be210dc692605bc98')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
