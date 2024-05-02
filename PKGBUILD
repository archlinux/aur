# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=prebs
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc='Probe region expression estimation for RNA-seq data for improved microarray comparability'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-affy
  r-biobase
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-rpa
  r-s4vectors
)
optdepends=(
  r-hgu133plus2cdf
  r-hgu133plus2probe
  r-prebsdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a73fa7332a4ece58f89c623fba2160d490dc5417ba8e422d3803012c0b17fe57')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
