# system requirements: Java Runtime Environment (>= 6)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=transcriptogramer
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Transcriptional analysis based on transcriptograms'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-data.table
  r-dosnow
  r-foreach
  r-ggplot2
  r-igraph
  r-limma
  r-progress
  r-reder
  r-snow
  r-tidyr
  r-topgo
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d0011171c28600192c57bc44bce2391cc5d01bffd7045cd25d4fc5c1978a9eff')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
