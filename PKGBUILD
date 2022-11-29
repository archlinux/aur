# system requirements: zlib headers and library.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqinr
_pkgver=4.2-23
pkgname=r-${_pkgname,,}
pkgver=4.2.23
pkgrel=1
pkgdesc='Biological Sequences Retrieval and Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ade4
  r-segmented
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('af2174178972f71821062daec3e3ce98edfec19dd133f6bbbf39f5dcd821fb93')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
