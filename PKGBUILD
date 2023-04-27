# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=m6Aboost
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='m6Aboost'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-adabag
  r-biostrings
  r-bsgenome
  r-dplyr
  r-experimenthub
  r-genomicranges
  r-iranges
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-bookdown
  r-bsgenome.mmusculus.ucsc.mm10
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('912e05052cfdb27f5a1be38529bc0b792237d084856b38f53be4fbc0c1c655f8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
