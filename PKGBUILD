# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=impute
_pkgver=1.74.1
pkgname=r-${_pkgname,,}
pkgver=1.74.1
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
sha256sums=('54a4ae2b50e51a5cef4df83a66c7ab6b26e3a1d9ca5ce83d10bc3c31ff7be85b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
