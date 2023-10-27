# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SeqGate
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Filtering of Lowly Expressed Features'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocmanager
  r-genomicranges
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-edger
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('63c32370dcd8f96edef04104858dffe3714f30b4bae38687962fe01834df7e5e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
