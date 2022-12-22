# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=energy
_pkgver=1.7-11
pkgname=r-${_pkgname,,}
pkgver=1.7.11
pkgrel=1
pkgdesc='E-Statistics: Multivariate Inference via the Energy of Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-gsl
  r-rcpp
)
optdepends=(
  r-compquadform
  r-mass
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c29f8fb000c979d2504f6f6d3a99c773004f77d58793e7e2a5766155272b6511')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
