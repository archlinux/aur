# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bnbc
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Bandwise normalization and batch correction of Hi-C data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-data.table
  r-ebimage
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-matrixstats
  r-preprocesscore
  r-rcpp
  r-rhdf5
  r-s4vectors
  r-summarizedexperiment
  r-sva
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('89116a18b093531044efd6d8279be747da8efbd0a68ad8c3a1f63eda941b3d41')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
