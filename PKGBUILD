# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genomes
_pkgver=3.28.0
pkgname=r-${_pkgname,,}
pkgver=3.28.0
pkgrel=1
pkgdesc='Genome sequencing project metadata'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-curl
  r-readr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('32f9c19c8361cbabc0c4d8f9022ef9904b912a58cc66c10f16665742c56755d3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
