# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gamlss.dist
_pkgver=6.0-5
pkgname=r-${_pkgname,,}
pkgver=6.0.5
pkgrel=1
pkgdesc='Distributions for Generalized Additive Models for Location Scale and Shape'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0f88afdfb148de79d3ece66bf4631ea0dc3ecf1188680802abffd6bc7139a20e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
