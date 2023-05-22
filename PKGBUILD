# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=transport
_pkgver=0.14-1
pkgname=r-${_pkgname,,}
pkgver=0.14.1
pkgrel=1
pkgdesc='Computation of Optimal Transport Plans and Wasserstein Distances'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-rcpp
  r-rcppeigen
)
optdepends=(
  r-animation
  r-ks
  r-testthat
  r-wsgeometry
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('59f24499b9acc3680824edf6f7eba65c6c4c08198cb0236a2af9daf288a4a890')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
