# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=motifcounter
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='R package for analysing TFBSs in DNA sequences'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
)
optdepends=(
  r-knitr
  r-motifdb
  r-prettydoc
  r-rmarkdown
  r-seqlogo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a18796a3dfd1f3fb351ba860d4e7c470d5b03557f339bcb280235e6f4b8e4bad')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
