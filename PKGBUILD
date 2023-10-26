# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=loci2path
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Loci2path: regulatory annotation of genomic intervals based on tissue-specific expression QTLs'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocparallel
  r-data.table
  r-genomicranges
  r-pheatmap
  r-rcolorbrewer
  r-s4vectors
  r-wordcloud
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5acddaee9d60082376282230538a27b76047ccbd3840278cfa73db6779d1a146')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
