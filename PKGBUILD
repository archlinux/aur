# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LoomExperiment
_pkgver=1.26.1
pkgname=r-${_pkgname,,}
pkgver=1.26.1
pkgrel=1
pkgdesc='LoomExperiment container'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocio
  r-delayedarray
  r-genomicranges
  r-hdf5array
  r-rhdf5
  r-s4vectors
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-reticulate
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e1790d127d9421dddbdc9365a5bc11952c682cbdc4b43e897c80c6236dd07823')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
