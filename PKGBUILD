# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rcpi
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Molecular Informatics Toolkit for Compound-Protein Interaction in Drug Discovery'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-chemminer
  r-doparallel
  r-fmcsr
  r-foreach
  r-gosemsim
  r-rcdk
  r-rcurl
  r-rjson
)
optdepends=(
  r-biocgenerics
  r-chemmineob
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0e129c83eb57c6e7cee6cd8e36d5a66a3466d9f53c0d0c6ffc7aa377fe60c478')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
