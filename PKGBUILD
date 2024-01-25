# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=laeken
_pkgver=0.5.3
pkgname=r-${_pkgname,,}
pkgver=0.5.3
pkgrel=1
pkgdesc='Estimation of Indicators on Social Exclusion and Poverty'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('60495f494f2a41b2ca94e11e3d0224843b7282cf8b2a859dbf6077a3bc97e80b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
