# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=recountmethylation
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=1.6.1
pkgrel=1
pkgdesc='Access and analyze DNA methylation database compilations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocfilecache
  r-hdf5array
  r-minfi
  r-r.utils
  r-rcurl
  r-rhdf5
  r-s4vectors
  r-illuminahumanmethylation450kmanifest
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-experimenthub
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-knitr
  r-limma
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b1944639f86647d9bce9842b5a06a3e9d3696e21f02c2fc3d7b26d806d15a8cc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
