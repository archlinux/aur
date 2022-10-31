# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=CVXR
_pkgver=1.0-11
pkgname=r-${_pkgname,,}
pkgver=1.0.11
pkgrel=1
pkgdesc='Disciplined Convex Optimization'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-bit64
  r-ecosolver
  r-gmp
  r-osqp
  r-r6
  r-rcpp
  r-rcppeigen
  r-rmpfr
  r-scs
)
optdepends=(
  r-cccp
  r-covr
  r-gurobi
  r-knitr
  r-nnls
  r-rcbc
  r-rcplex
  r-rglpk
  r-rmarkdown
  r-rmosek
  r-slam
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e92a9638f35f4909e2a29c3b7106081e3dae7ff88b14bb6466b87fbdc80b972a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
