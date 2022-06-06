# system requirements: GNU make, meme, fimo
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dpeak
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='dPeak (Deconvolution of Peaks in ChIP-seq Analysis)'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bsgenome
  r-iranges
  r-rcpp
)
optdepends=(
  r-bsgenome.ecoli.ncbi.20080805
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('96bd43ba71162cdc40172646961194b99c5d16c49c34c255fa3cb6929a479b1d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
