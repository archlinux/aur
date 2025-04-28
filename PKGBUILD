# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=curatedTCGAData
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Curated Data From The Cancer Genome Atlas (TCGA) as MultiAssayExperiment Objects'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationhub
  r-experimenthub
  r-hdf5array
  r-multiassayexperiment
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-raggedexperiment
  r-readr
  r-rmarkdown
  r-tcgautils
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('16a35c4e4d3c817696eb1ca13c2aaf9ea9571054fb16c4284756de64bc4d6b93')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
