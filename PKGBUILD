# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gamlss
_pkgver=5.4-12
pkgname=r-${_pkgname,,}
pkgver=5.4.12
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
sha256sums=('9f791039f7e5c3cf3f6a2da955994a8c41c43044a2d77d99b289e4f82118a6f0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
