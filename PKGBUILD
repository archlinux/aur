# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=baySeq
_pkgver=2.36.1
pkgname=r-${_pkgname,,}
pkgver=2.36.1
pkgrel=1
pkgdesc='Empirical Bayesian analysis of patterns of differential expression in count data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-edger
  r-genomicranges
)
optdepends=(
  r-biocgenerics
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f507ecaf18cdd90e97ac160cede0b505368038ba8214315835fd3e3cc047a469')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
