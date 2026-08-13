# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=prebs
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
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
sha256sums=('06eed1cff44662b5f9632c42ab283b8dba087265972ac0fca744f4f437fd59a8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
