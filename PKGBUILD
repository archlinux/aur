# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TrajectoryGeometry
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='This Package Discovers Directionality in Time and Pseudo-times Series of Gene Expression Patterns'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-ggplot2
  r-pracma
  r-rgl
)
optdepends=(
  r-dplyr
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c7f83f22c403cf22c41e9ff8edbe26839a5f3ba42e9836e340a7bbcfe21f83f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
