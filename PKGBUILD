# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=omicRexposome
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Exposome and omic data associatin and integration analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-isva
  r-limma
  r-multidataset
  r-omicade4
  r-pma
  r-rexposome
  r-smartsva
  r-stringr
  r-summarizedexperiment
  r-sva
)
optdepends=(
  r-biocstyle
  r-brgedata
  r-knitr
  r-rmarkdown
  r-snpstats
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c714c18606fab8b8b8321c665e70543c026f24366fc83202d168605466346141')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
