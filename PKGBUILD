# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phantasus
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Visual and interactive gene expression analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationdbi
  r-assertthat
  r-biobase
  r-ccapp
  r-curl
  r-data.table
  r-deseq2
  r-edger
  r-fgsea
  r-geoquery
  r-ggplot2
  r-gtable
  r-htmltools
  r-httpuv
  r-httr
  r-jsonlite
  r-limma
  r-opencpu
  r-pheatmap
  r-protolite
  r-rhdf5
  r-rook
  r-scales
  r-stringr
  r-svglite
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8d4921c1a7e26d000eba0f8961c323f1ca07e09248ec93d5109a1cca74f2c96b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
