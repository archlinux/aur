# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggpointdensity
_pkgver=0.2.0
pkgname=r-${_pkgname,,}
pkgver=0.2.0
pkgrel=1
pkgdesc='A Cross Between a 2D Density Plot and a Scatter Plot'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
)
optdepends=(
  r-dplyr
  r-viridis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('611ecce4f8b7cfb8ccb31b2a7df2dbb8f1eb5cbb7b49db860785ebac8098f21e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
