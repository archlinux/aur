# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gam
_pkgver=1.22-3
pkgname=r-${_pkgname,,}
pkgver=1.22.3
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
sha256sums=('66cd688e3b86b9a4ee8ec565ebc8a19aa45e0a282e6de40ef2b78d6846787194')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
