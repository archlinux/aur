# system requirements: python (>= 2.7), sklearn, numpy, pandas, h5py
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocSklearn
_pkgver=1.20.1
pkgname=r-${_pkgname,,}
pkgver=1.20.1
pkgrel=3
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
sha256sums=('6d174ccbbe6d747644786e87eeeb0a482f08955eb0eb728310eaa1618dc70f9e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
