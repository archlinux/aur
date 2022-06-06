# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gamlss
_pkgver=5.4-3
pkgname=r-${_pkgname,,}
pkgver=5.4.3
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
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6619d4fdc183ab492615d44961a126c827d18db20a0d59362e54de877f0a3076')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
