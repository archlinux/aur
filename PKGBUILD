# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CancerSubtypes
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
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
sha256sums=('c1f376c8c9a3f978051daba94ba3fee7873a6f88f1254a36f7c9c7fb9680e7b6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
