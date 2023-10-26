# system requirements: Java Runtime Environment (>= 6)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=transcriptogramer
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
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
sha256sums=('540713671b8c77e9f789e7e4f7553f668a5a73f225d1d4f2ca4fc4603b0b5e9e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
