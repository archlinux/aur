# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=readstata13
_pkgver=0.10.1
pkgname=r-${_pkgname,,}
pkgver=0.10.1
pkgrel=1
pkgdesc="Import 'Stata' Data Files"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('117b78be07c897b9efb7709ac9957cb11950ce4426fad774efba01f4b53dd9a3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
