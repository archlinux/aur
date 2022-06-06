# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tweedie
_pkgver=2.3.3
pkgname=r-${_pkgname,,}
pkgver=2.3.3
pkgrel=4
pkgdesc='Evaluation of Tweedie Exponential Family Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-stabledist
  r-statmod
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a032cad512dac37a8619e6f66cb513eb82a88a5a2ffbe91e92c2d44d1756d0d9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
