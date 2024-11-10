# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ORFhunteR
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Predict open reading frames in nucleotide sequences'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-bsgenome.hsapiens.ucsc.hg38
  r-data.table
  r-peptides
  r-randomforest
  r-rcpp
  r-rtracklayer
  r-stringr
  r-xfun
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('08376b4f80169f55ea7604651bcca8173d048447db73398d5a5653296b3ef3e7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
