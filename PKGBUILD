# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SCArray
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=3
pkgdesc='Large-scale single-cell RNA-seq data manipulation with GDS files'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-delayedarray
  r-delayedmatrixstats
  r-gdsfmt
  r-iranges
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-hdf5array
  r-knitr
  r-markdown
  r-matrix
  r-rhdf5
  r-rmarkdown
  r-runit
  r-scater
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2b019e67a3fa7ef4c636cf06f3f1cf44386d497221536dfbc2451e045b133033')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
