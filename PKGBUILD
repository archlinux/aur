# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=snapcount
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='R/Bioconductor Package for interfacing with Snaptron for rapid querying of expression counts'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-assertthat
  r-data.table
  r-genomicranges
  r-httr
  r-iranges
  r-jsonlite
  r-magrittr
  r-purrr
  r-r6
  r-rlang
  r-stringr
  r-summarizedexperiment
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-bit64
  r-covr
  r-devtools
  r-knitcitations
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0cf9207d607210d18ce0c8240ba0f040cde8c044fb11d673e3435c3f6466227a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
