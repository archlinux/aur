# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scico
_pkgver=1.5.0
pkgname=r-${_pkgname,,}
pkgver=1.5.0
pkgrel=1
pkgdesc='Colour Palettes Based on the Scientific Colour-Maps'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-scales
)
optdepends=(
  r-covr
  r-dplyr
  r-ggplot2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('647121b3f64118b162a35f9709a301f696239e9a707a04559c0368617c01c9b0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
