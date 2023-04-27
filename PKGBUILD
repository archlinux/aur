# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=impute
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=1.74.0
pkgrel=1
pkgdesc='impute: Imputation for microarray data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1ab46a0b792be73c5fac4ca70f70775a39e1b39dd8175688490a80ffe8fe43c4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
