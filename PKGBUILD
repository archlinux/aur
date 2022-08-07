# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nleqslv
_pkgver=3.3.3
pkgname=r-${_pkgname,,}
pkgver=3.3.3
pkgrel=1
pkgdesc='Solve Systems of Nonlinear Equations'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2e46dfce95ddfd7ed5208413ee41f6bdf1ae18414fb1d0c146d9da3af12ac633')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
