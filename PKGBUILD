# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ptw
_pkgver=1.9-17
pkgname=r-${_pkgname,,}
pkgver=1.9.17
pkgrel=1
pkgdesc='Parametric Time Warping'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcppde
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3c5ff31b3d5e9a752fe632b7db00ac820a70b36dd52c1a96e502f34c0a8c5558')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
