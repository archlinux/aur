# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ICS
_pkgver=1.3-2
pkgname=r-${_pkgname,,}
pkgver=1.3.2
pkgrel=1
pkgdesc='Tools for Exploring Multivariate Data via ICS/ICA'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-mvtnorm
  r-survey
)
optdepends=(
  r-icsnp
  r-mass
  r-pixmap
  r-robustbase
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('332e1147a4dec3a26aca69a8925bc9a9a4d495d22dafd5286091b665e0286402')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
