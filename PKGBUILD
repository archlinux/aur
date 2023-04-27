# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biomaRt
_pkgver=2.56.0
pkgname=r-${_pkgname,,}
pkgver=2.56.0
pkgrel=1
pkgdesc='Interface to BioMart databases (i.e. Ensembl)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biocfilecache
  r-digest
  r-httr
  r-progress
  r-rappdirs
  r-stringr
  r-xml
  r-xml2
)
optdepends=(
  r-biocstyle
  r-knitr
  r-mockery
  r-rmarkdown
  r-testthat
  r-webmockr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('07ecc7641e8431bedc307e0007d1ea35e708f64f874a3e1a05990766b1f69281')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
