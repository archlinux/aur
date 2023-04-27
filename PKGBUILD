# system requirements: python (>= 2.7), sklearn, numpy, pandas, h5py
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocSklearn
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
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
sha256sums=('be8d5aa2c06012a502076d45a71fb61748a543a85a732dec504491468da5ff3d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
