# system requirements: zlib headers and library.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqinr
_pkgver=4.2-44
pkgname=r-${_pkgname,,}
pkgver=4.2.44
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
sha256sums=('09dc45c9c3c23317c4bf3f661d9f6333a90818f29b32075b28dedf310febfd19')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
