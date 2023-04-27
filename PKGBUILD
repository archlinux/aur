# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=exomeCopy
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=1
pkgdesc='Copy number variant detection from exome sequencing read depth'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-rsamtools
)
optdepends=(
  r-biostrings
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3eadfc50e40be37aa4d0b0b37ccb86ff6f47f819e80ec36fa92ee8d5eed49aba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
