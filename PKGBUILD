# system requirements: C++11, zlib headers and libraries, GNU make,optionally also bzip2 and POSIX-compliant regex functions.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqminer
_pkgver=8.9
pkgname=r-${_pkgname,,}
pkgver=8.9
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
sha256sums=('218e58fb70152432ace635d4f867d3a7123f480b79b30fc5a82c932f59f0dab2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
