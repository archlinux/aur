# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DNAcopy
_pkgver=1.74.1
pkgname=r-${_pkgname,,}
pkgver=1.74.1
pkgrel=1
pkgdesc='DNA copy number data analysis'
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
sha256sums=('5d0d7e7e31377aa696b93c157bd7df972409288ed13dde7fa9ac40b6f53c48ae')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
