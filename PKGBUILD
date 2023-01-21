# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DNAcopy
_pkgver=1.72.3
pkgname=r-${_pkgname,,}
pkgver=1.72.3
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
sha256sums=('dc1eac19ad9e414cbf69eedabf23a23a1c104bc87f1f21f14d0db714bccdbfcf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
