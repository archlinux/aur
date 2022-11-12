# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=omicsPrint
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Cross omic genetic fingerprinting'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-matrixstats
  r-multiassayexperiment
  r-raggedexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocparallel
  r-biocstyle
  r-fdb.infiniummethylation.hg19
  r-genomicranges
  r-geoquery
  r-knitr
  r-rmarkdown
  r-rsamtools
  r-snpstats
  r-testthat
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e4f36136ab0d60979841bbd63b4afaaad96845d5aa13701c5a37350bfc6f517e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
