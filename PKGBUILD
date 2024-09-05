# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ccaPP
_pkgver=0.3.4
pkgname=r-${_pkgname,,}
pkgver=0.3.4
pkgrel=1
pkgdesc='(Robust) Canonical Correlation Analysis via Projection Pursuit'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-pcapp
  r-rcpp
  r-rcpparmadillo
  r-robustbase
)
optdepends=(
  r-knitr
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a51162e5ec62a73773d98647d646d42c3c3b15119253fb997cc25489394a7c99')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
