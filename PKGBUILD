# system requirements: C++11, zlib headers and libraries, GNU make,optionally also bzip2 and POSIX-compliant regex functions.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqminer
_pkgver=8.6
pkgname=r-${_pkgname,,}
pkgver=8.6
pkgrel=1
pkgdesc='Efficiently Read Sequence Data (VCF Format, BCF Format, METAL Format and BGEN Format) into R'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-skat
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8a850c731e269cb01a7660c0cb6d3d3c3bb58fb2dc1f2121d8e5c2525535a7ba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
