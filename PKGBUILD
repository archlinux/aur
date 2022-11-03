# system requirements: python (>= 2.7), sklearn, numpy, pandas, h5py
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocSklearn
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='interface to python sklearn via Rstudio reticulate'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-basilisk
  r-knitr
  r-rcpp
  r-reticulate
  r-summarizedexperiment
  python
  python-scikit-learn
  python-numpy
  python-pandas
  python-h5py
)
optdepends=(
  r-biocstyle
  r-hdf5array
  r-restfulse
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('821c4f3982030509c6b93db35e2ac16d91808c65ef277509af04cd1370463211')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
