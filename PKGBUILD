# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MetBrewer
_pkgver=0.2.0
pkgname=r-${_pkgname,,}
pkgver=0.2.0
pkgrel=1
pkgdesc='Color Palettes Inspired by Works at the Metropolitan Museum of Art'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('CC0')
depends=(
  r
  r-ggplot2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e7be2881416d909672462d49c6cc82aa63132423102765f3208036967e79a174')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
