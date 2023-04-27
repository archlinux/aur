# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MultiAssayExperiment
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Software for the integration of multi-omics experiments in Bioconductor'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocbaseutils
  r-biocgenerics
  r-delayedarray
  r-genomicranges
  r-iranges
  r-s4vectors
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-hdf5array
  r-knitr
  r-maftools
  r-r.rsp
  r-raggedexperiment
  r-rmarkdown
  r-survival
  r-survminer
  r-testthat
  r-upsetr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('40e49f2da1d725a2741d2a6a61dbc8935f5a841ba7ef05c6e925aa848362af03')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
