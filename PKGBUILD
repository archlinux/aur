# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ineq
_pkgver=0.2-13
pkgname=r-${_pkgname,,}
pkgver=0.2.13
pkgrel=4
pkgdesc='Measuring Inequality, Concentration, and Poverty'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e0876403f59a3dfc2ea7ffc0d965416e1ecfdecf154e5856e5f54800b3efda25')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
