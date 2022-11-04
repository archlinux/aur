# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metavizr
_pkgver=1.21.0
pkgname=r-${_pkgname,,}
pkgver=1.21.0
pkgrel=1
pkgdesc='R Interface to the metaviz web app for interactive metagenomics data analysis and visualization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-data.table
  r-digest
  r-epivizr
  r-epivizrdata
  r-epivizrserver
  r-epivizrstandalone
  r-genomeinfodb
  r-httr
  r-metagenomeseq
  r-phyloseq
  r-vegan
)
optdepends=(
  r-biocstyle
  r-etec16s
  r-experimenthub
  r-gss
  r-knitr
  r-matrixstats
  r-msd16s
  r-rmarkdown
  r-testthat
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bac67d6bc05818abd6bfaffc6969b74a7e5f00ae737b4de715b5584d0a7208b5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
