# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DegNorm
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='DegNorm: degradation normalization for RNA-seq data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-data.table
  r-doparallel
  r-foreach
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-heatmaply
  r-iranges
  r-plotly
  r-plyr
  r-rcpp
  r-rcpparmadillo
  r-rsamtools
  r-s4vectors
  r-viridis
)
optdepends=(
  r-formatr
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dfde2d06f0dfd30f748f20a400390aa7dfd07407b90cc68a082445f21d6b57b4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
