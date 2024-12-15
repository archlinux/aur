# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GOTHiC
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Binomial test for Hi-C data analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocmanager
  r-biostrings
  r-bsgenome
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-shortread
)
optdepends=(
  r-hicdatalymphoblast
  r-parallel
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3ced6d57aba7c97e956c3110b0f26fb305a7088464f8abbc3182e66eb3775f31')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
