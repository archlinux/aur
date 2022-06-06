# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggrastr
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=1.0.1
pkgrel=4
pkgdesc="Rasterize Layers for 'ggplot2'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-cairo
  r-ggbeeswarm
  r-ggplot2
  r-png
  r-ragg
)
optdepends=(
  r-knitr
  r-maps
  r-rmarkdown
  r-sf
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('82d6e90fa38dec85e829f71018532ed5b709a50a585455fc07cb3bae282f5d1f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
