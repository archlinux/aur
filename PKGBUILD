# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=midasHLA
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='R package for immunogenomics data handling and association analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-assertthat
  r-broom
  r-dplyr
  r-formattable
  r-hardyweinberg
  r-kableextra
  r-knitr
  r-magrittr
  r-multiassayexperiment
  r-qdaptools
  r-rlang
  r-s4vectors
  r-stringi
  r-summarizedexperiment
  r-tibble
)
optdepends=(
  r-broom.mixed
  r-cowplot
  r-devtools
  r-ggplot2
  r-ggpubr
  r-rmarkdown
  r-seqinr
  r-survival
  r-testthat
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('feb38afb555f7c705271ec025cd8bdb656c5415e928a53fd5b48bb8ad0beff34')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENCE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
