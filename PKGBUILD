# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TENxPBMCData
_pkgver=1.17.0
pkgname=r-${_pkgname,,}
pkgver=1.17.0
pkgrel=1
pkgdesc='PBMC data from 10X Genomics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
  r-annotationhub
  r-experimenthub
  r-hdf5array
  r-singlecellexperiment
)
optdepends=(
  r-biocfilecache
  r-biocparallel
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-snow
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('281ffd065f38d2b618036ddefa7db41b68a8c747d31805f8b03c9b4f90bd29e6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
