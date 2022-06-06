# system requirements: A POSIX system. Currently Linux and OS X are knownto work. GNU make.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PRIMME
_pkgver=3.2-2
pkgname=r-${_pkgname,,}
pkgver=3.2.2
pkgrel=1
pkgdesc='Eigenvalues and Singular Values and Vectors from Large Matrices'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  make
)
optdepends=(
  r-matrix
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('53149390aacc093a3313e8fadf7e3aebeceb867623e105e1abcfccf997f7552e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
