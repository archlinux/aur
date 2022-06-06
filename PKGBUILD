# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qap
_pkgver=0.1-1
pkgname=r-${_pkgname,,}
pkgver=0.1.1
pkgrel=4
pkgdesc='Heuristics for the Quadratic Assignment Problem (QAP)'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-testthat
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('60bd564bb0e6325de44351af33870177d84b1c00ded142a2efb12a16a20d4d34')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
