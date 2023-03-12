# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.data
_pkgver=3.0-1
pkgname=r-${_pkgname,,}
pkgver=3.0.1
pkgrel=1
pkgdesc="Datasets for 'spatstat' Family"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-spatstat.utils
)
optdepends=(
  r-spatstat.explore
  r-spatstat.geom
  r-spatstat.linnet
  r-spatstat.model
  r-spatstat.random
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8eeb4b1de356e9cef42f58b5e0fc7ced2a476a1306e09395ba97253b22dd5300')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
