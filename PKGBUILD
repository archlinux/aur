# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gamlss.dist
_pkgver=6.0-3
pkgname=r-${_pkgname,,}
pkgver=6.0.3
pkgrel=3
pkgdesc='Distributions for Generalized Additive Models for Location Scale and Shape'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ec90ea83cd81b894c73f987f69814077697be33abf0708e0f3e2a39d02c912bf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
