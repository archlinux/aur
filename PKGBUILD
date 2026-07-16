# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SCArray
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Large-scale single-cell RNA-seq data manipulation with GDS files'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-biocsingular
  r-delayedarray
  r-delayedmatrixstats
  r-gdsfmt
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
  r-hdf5array
  r-knitr
  r-markdown
  r-rhdf5
  r-rmarkdown
  r-runit
  r-scater
  r-scuttle
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b8d4d3adcb9f62d00a246f89d4672a533e7a26a0c48cebc5774ae487aa894977')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
