# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=lmom
_pkgver=3.0
pkgname=r-${_pkgname,,}
pkgver=3.0
pkgrel=1
pkgdesc='L-Moments'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('CPL')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4b0ae8638a63b45ddedfd65c15e3206d34e947a2b5d31e9aa8c55446d69a0291')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
