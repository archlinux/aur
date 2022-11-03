# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nanotatoR
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Next generation structural variant annotation and classification'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-annotationdbi
  r-curl
  r-dplyr
  r-genomicranges
  r-hash
  r-httr
  r-knitr
  r-openxlsx
  r-org.hs.eg.db
  r-rentrez
  r-rlang
  r-stringr
  r-testthat
  r-tidyverse
  r-varfrompdb
  r-xml
  r-xml2r
)
optdepends=(
  r-rmarkdown
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1f249f8f8f50f66d9358dde7a1396ba8deddc7736515f6581b3687c8819569d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
