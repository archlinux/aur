# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=readstata13
_pkgver=0.10.0
pkgname=r-${_pkgname,,}
pkgver=0.10.0
pkgrel=4
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
sha256sums=('e9986d52f447cce78dc85d968eb164151830d58bb7d78906b2306cddbfaba72c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
