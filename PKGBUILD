# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=wavethresh
_pkgver=4.7.2
pkgname=r-${_pkgname,,}
pkgver=4.7.2
pkgrel=1
pkgdesc='Wavelets Statistics and Transforms'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9a9774ca23496df4ecaa2bf9bff345a2ae40ded07f6afd81dd8847d48b43b656')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
