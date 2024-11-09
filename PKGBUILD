# system requirements: python (>= 2.7), sklearn, numpy, pandas, h5py
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocSklearn
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='interface to python sklearn via Rstudio reticulate'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  python
  python-h5py
  python-numpy
  python-pandas
  python-scikit-learn
  r
  r-basilisk
  r-reticulate
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-hdf5array
  r-knitr
  r-restfulse
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('54097da685c1ad98bc59faf692f7a94c7c1a706b00dc8166cb2004c2d93f8145')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
