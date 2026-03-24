# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arm
_pkgver=1.15-2
pkgname=r-${_pkgname,,}
pkgver=1.15.2
pkgrel=1
pkgdesc='Data Analysis Using Regression and Multilevel/Hierarchical Models'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-coda
  r-lme4
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('69ea9c19263084c303208b201e7bf086ec56e343e229b17b27b0e0ea73fb96f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
