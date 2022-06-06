# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tnet
_pkgver=3.0.16
pkgname=r-${_pkgname,,}
pkgver=3.0.16
pkgrel=1
pkgdesc='Weighted, Two-Mode, and Longitudinal Networks Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('890ac3a8c144d6d755bcd4bf53b0889cbd09dfeaddf11c05fdea13b37ef24224')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
