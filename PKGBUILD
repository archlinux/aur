# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=rvg
_pkgver=0.4.1
pkgname=r-${_pkgname,,}
pkgver=0.4.1
pkgrel=1
pkgdesc='R Graphics Devices for Vector Graphics Output'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-gdtools
  r-officer
  r-rcpp
  r-rlang
  r-xml2
)
optdepends=(
  r-grid
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c87dffc7ecf628b839b470d25b7b4463699c259fc19694284f6f855483a5817e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
