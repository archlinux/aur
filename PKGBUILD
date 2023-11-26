# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=GeneralizedHyperbolic
_pkgver=0.8-6
pkgname=r-${_pkgname,,}
pkgver=0.8.6
pkgrel=1
pkgdesc='The Generalized Hyperbolic Distribution'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-distributionutils
)
optdepends=(
  r-actuar
  r-runit
  r-skewhyperbolic
  r-variancegamma
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('994454f356ec598b887cb6112f4efd2adc438fb970eacb68d4e97666164c36a9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
