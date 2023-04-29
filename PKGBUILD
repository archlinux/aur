# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scry
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=3
pkgdesc='Small-Count Analysis Methods for High-Dimensional Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocsingular
  r-delayedarray
  r-glmpca
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
  r-covr
  r-duoclustering2018
  r-ggplot2
  r-hdf5array
  r-knitr
  r-markdown
  r-rmarkdown
  r-tenxpbmcdata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3fd7db9d35a46c5574f6927ef3fffed15c551b9b2a6cae3b4d1519d228d50610')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
