# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gamlss
_pkgver=5.4-22
pkgname=r-${_pkgname,,}
pkgver=5.4.22
pkgrel=1
pkgdesc='Generalised Additive Models for Location Scale and Shape'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-gamlss.data
  r-gamlss.dist
)
optdepends=(
  r-distributions3
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('01e6908df92691147b884a8d58025473e18d7bf58d5f5a2d7e4f18b2a451fe2d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
