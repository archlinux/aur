# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mbest
_pkgver=0.6.1
pkgname=r-${_pkgname,,}
pkgver=0.6.1
pkgrel=1
pkgdesc='Moment-Based Estimation for Hierarchical Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-abind
  r-bigmemory
  r-foreach
  r-lme4
  r-logging
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b0f408c57ef7671657f745373db7de1338eec4501cba7a66c5d9c13c3d9ed20f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
