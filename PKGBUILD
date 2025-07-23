# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=emdbook
_pkgver=1.3.14
pkgname=r-${_pkgname,,}
pkgver=1.3.14
pkgrel=1
pkgdesc='Support Functions and Data for "Ecological Models and Data"'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bbmle
  r-coda
  r-plyr
)
optdepends=(
  r-ellipse
  r-numderiv
  r-r2jags
  r-rgl
  r-suppdists
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('afca37687ff6ce9d93812ced12b3cd7627635a8654e2ee52ab7082e82cb0a0a2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
