# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gam
_pkgver=1.22
pkgname=r-${_pkgname,,}
pkgver=1.22
pkgrel=3
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
sha256sums=('3131302920824a2f566f8f9e7b6e8f085a66f603360d1374568c0de3c679d93f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
