# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ipdDb
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='IPD IMGT/HLA and IPD KIR database for Homo sapiens'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-annotationhub
  r-assertthat
  r-biostrings
  r-dbi
  r-genomicranges
  r-iranges
  r-rsqlite
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5fa8d024e16d58e8df7c1131a4ff45412b0fbb5d5596b6232a16a74b5058fff5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
