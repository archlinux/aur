# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CancerSubtypes
_pkgver=1.22.1
pkgname=r-${_pkgname,,}
pkgver=1.22.1
pkgrel=1
pkgdesc='Cancer subtypes identification, validation and visualization based on multiple genomic data sets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-consensusclusterplus
  r-icluster
  r-impute
  r-limma
  r-nmf
  r-sigclust
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-rmarkdown
  r-rtcga.mrna
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1d3ca8f6b19726c9eaf0cb6ea7dd1491df269fc206903df0c279d350412be335')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
