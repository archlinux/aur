# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gam
_pkgver=1.22-5
pkgname=r-${_pkgname,,}
pkgver=1.22.5
pkgrel=1
pkgdesc='Generalized Additive Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-foreach
)
optdepends=(
  r-interp
  r-testthat
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7d33a1005e0982781b47bed611f0b0e0f450717d39ba7b97439f9b532182e955')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
