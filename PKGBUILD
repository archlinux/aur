# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rcpi
_pkgver=1.32.2
pkgname=r-${_pkgname,,}
pkgver=1.32.2
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
sha256sums=('820984fd26d407cd31b5080b0c2b17a2800058f977ecc10aa40253aa97b7dc66')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
