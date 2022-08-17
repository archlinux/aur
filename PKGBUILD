# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geepack
_pkgver=1.3.9
pkgname=r-${_pkgname,,}
pkgver=1.3.9
pkgrel=1
pkgdesc='Generalized Estimating Equation Package'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-broom
  r-magrittr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a106fdf99a7070243c412f0117f0f4e3954b2bae81266fba272e9c85040dcde7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
