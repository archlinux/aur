# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MultiDataSet
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Implementation of MultiDataSet and ResultSet'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-genomicranges
  r-ggplot2
  r-ggrepel
  r-iranges
  r-limma
  r-qqman
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-brgedata
  r-geoquery
  r-iclusterplus
  r-knitr
  r-minfi
  r-minfidata
  r-multiassayexperiment
  r-omicade4
  r-raggedexperiment
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a0c4ad655a174f4a570f2a14c23cdfb39fdf7f182082cfa003d94d5cf8b71c11')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
