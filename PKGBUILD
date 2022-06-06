# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=heatmap3
_pkgver=1.1.9
pkgname=r-${_pkgname,,}
pkgver=1.1.9
pkgrel=4
pkgdesc='An Improved Heatmap Package'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fastcluster
)
optdepends=(
  r-knitr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('594c33947b2be2cc8a592075f41a0df2398c892add7d63a15c613a5eeb8fdb69')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
