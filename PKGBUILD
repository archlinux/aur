# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=emdbook
_pkgver=1.3.13
pkgname=r-${_pkgname,,}
pkgver=1.3.13
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
sha256sums=('26044b7ea1b42304b4dfde48afa94dd487acf979da4db2bf670ba41222083c19')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
