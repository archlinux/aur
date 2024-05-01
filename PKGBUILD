# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genomes
_pkgver=3.34.0
pkgname=r-${_pkgname,,}
pkgver=3.34.0
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
sha256sums=('29461f06ee9885fe6fd14a91aec06cf836a7127ea767dac9c7defcf3fd5d64e1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
