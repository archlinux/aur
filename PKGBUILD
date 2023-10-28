# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=prebs
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
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
sha256sums=('8f747c59fd43eef98d24c39b8215edce3245cb5ee96faea1cc9dd2e7531fe7fd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
