# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggbeeswarm
_pkgver=0.6.0
pkgname=r-${_pkgname,,}
pkgver=0.6.0
pkgrel=4
pkgdesc='Categorical Scatter (Violin Point) Plots'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-beeswarm
  r-ggplot2
  r-vipor
)
optdepends=(
  r-gridextra
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bbac8552f67ff1945180fbcda83f7f1c47908f27ba4e84921a39c45d6e123333')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
