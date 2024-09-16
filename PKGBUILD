# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=transport
_pkgver=0.15-4
pkgname=r-${_pkgname,,}
pkgver=0.15.4
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
sha256sums=('4e9342f6fd65dc39c9dfed20cb0312d34899b9cb0648aa5a67516ce7711c20cf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
