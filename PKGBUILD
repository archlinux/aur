# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=GeneralizedHyperbolic
_pkgver=0.8-4
pkgname=r-${_pkgname,,}
pkgver=0.8.4
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
sha256sums=('95967156dd694d40654fd5a1f626c866c2525a1e74fd176deb906af7eb76f805')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
