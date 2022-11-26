# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.data
_pkgver=3.0-0
pkgname=r-${_pkgname,,}
pkgver=3.0.0
pkgrel=3
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
sha256sums=('cff9058a88489020a4a05b9576cd452f37fa9b42084873c474d06931f5187057')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
