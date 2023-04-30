# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggbeeswarm
_pkgver=0.7.2
pkgname=r-${_pkgname,,}
pkgver=0.7.2
pkgrel=1
pkgdesc='Categorical Scatter (Violin Point) Plots'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-beeswarm
  r-ggplot2
  r-lifecycle
  r-vipor
)
optdepends=(
  r-gridextra
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fd7ca265bb892dde514d5f8d6a853fb8b32d7a673b05e9c8b50544a523299ce5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
