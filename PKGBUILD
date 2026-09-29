# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=Bessel
_pkgver=0.7-1
pkgname=r-${_pkgname,,}
pkgver=0.7.1
pkgrel=2
pkgdesc='Computations and Approximations for Bessel Functions'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rmpfr
)
optdepends=(
  r-gsl
  r-sfsmisc
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('94685c1cfca1f6fac61fc60ad1e7fd90f6767702d063a950f339402a1dc394e3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
