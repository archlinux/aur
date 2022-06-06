# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ROI
_pkgver=1.0-0
pkgname=r-${_pkgname,,}
pkgver=1.0.0
pkgrel=4
pkgdesc='R Optimization Infrastructure'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-registry
  r-slam
)
optdepends=(
  r-numderiv
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b0d87fb4ed2137d982734f3c5cdc0305aabe6e80f95de29655d02a9e82a0a341')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
