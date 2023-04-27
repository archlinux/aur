# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TIN
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Transcriptome instability analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-aroma.affymetrix
  r-data.table
  r-impute
  r-squash
  r-stringr
  r-wgcna
)
optdepends=(
  r-affxparser
  r-aroma.light
  r-biocgenerics
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6c75a133299a6582ee40c075bb01cf1a1cb2a80cb8c5a8739d98947c08bf6627')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
