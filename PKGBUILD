# system requirements: A POSIX system. Currently Linux and OS X are knownto work. GNU make.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PRIMME
_pkgver=3.2-5
pkgname=r-${_pkgname,,}
pkgver=3.2.5
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
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1ce452cadf3e56ec4ed5890bb7ab74189c9a5846adefbaab90491a058e908d07')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
