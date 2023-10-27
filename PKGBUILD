# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EDASeq
_pkgver=2.36.0
pkgname=r-${_pkgname,,}
pkgver=2.36.0
pkgrel=1
pkgdesc='Exploratory Data Analysis and Normalization for RNA-Seq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-aroma.light
  r-biobase
  r-biocgenerics
  r-biocmanager
  r-biomart
  r-biostrings
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-rsamtools
  r-shortread
)
optdepends=(
  r-biocstyle
  r-deseq2
  r-edger
  r-kernsmooth
  r-knitr
  r-leebamviews
  r-rmarkdown
  r-testthat
  r-yeastrnaseq
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('08e4183209febbb6625c673449f5e7f1860b7dedcf4c61173936b8697d2d7177')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
