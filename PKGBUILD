# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=svgPanZoom
_pkgver=0.3.4
pkgname=r-${_pkgname,,}
pkgver=0.3.4
pkgrel=4
pkgdesc="R 'Htmlwidget' to Add Pan and Zoom to Almost any R Graphic"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-htmlwidgets
)
optdepends=(
  r-gridsvg
  r-htmltools
  r-knitr
  r-svglite
  r-xml
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('02368f3640853cae6c9ea478fe4dc038c05e1d136a2568c221b8b8ee177ff4c5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
