# system requirements: bcl2Fastq (versions >= 2.1.7)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=basecallQC
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Working with Illumina Basecalling and Demultiplexing input and output files'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-dplyr
  r-dt
  r-ggplot2
  r-knitr
  r-lazyeval
  r-magrittr
  r-prettydoc
  r-raster
  r-rmarkdown
  r-shortread
  r-stringr
  r-tidyr
  r-xml
  r-yaml
)
optdepends=(
  r-biocstyle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fae6a98de6fb1d5bdc0d017a0b053584d247eb8791aa723a22ffabf5f3ca652a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
