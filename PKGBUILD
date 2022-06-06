# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=emdbook
_pkgver=1.3.12
pkgname=r-${_pkgname,,}
pkgver=1.3.12
pkgrel=4
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
sha256sums=('0646caf9e15aaa61ff917a4b5fdf82c06ac17ef221a61dec3fbb554e7bff4353')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
