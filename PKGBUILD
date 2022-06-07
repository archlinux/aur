# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tmvtnorm
_pkgver=1.5
pkgname=r-${_pkgname,,}
pkgver=1.5
pkgrel=3
pkgdesc='Truncated Multivariate Normal and Student t Distribution'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-gmm
  r-mvtnorm
)
optdepends=(
  r-lattice
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1c7a606bdce4319a6fdb4180fef499c293df3412d8583e296869521ece5460fe')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
