# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=deepSNV
_pkgver=1.42.1
pkgname=r-${_pkgname,,}
pkgver=1.42.1
pkgrel=1
pkgdesc='Detection of subclonal SNVs in deep sequencing data.'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-genomicranges
  r-iranges
  r-rhtslib
  r-summarizedexperiment
  r-variantannotation
  r-vgam
  make
)
optdepends=(
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f64d43645d696af7b375c66f7dccf877d099482f8470dd18c4aba8b1f30bf22d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
