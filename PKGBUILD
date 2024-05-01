# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=baySeq
_pkgver=2.38.0
pkgname=r-${_pkgname,,}
pkgver=2.38.0
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
sha256sums=('343d1ffece90f2ce5da7a37f41b471f2e6ad35abb7ed811272867619bff5935a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
