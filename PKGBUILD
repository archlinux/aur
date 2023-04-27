# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metagene
_pkgver=2.31.0
pkgname=r-${_pkgname,,}
pkgver=2.31.0
pkgrel=1
pkgdesc='A package to produce metagene plots'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocparallel
  r-data.table
  r-ensdb.hsapiens.v86
  r-ensembldb
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-gplots
  r-iranges
  r-magrittr
  r-matrixstats
  r-purrr
  r-r6
  r-rsamtools
  r-rtracklayer
  r-stringr
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
  r-similarpeak
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e8b2391a7db54ab6b9da01843faaaf8ec1d0fd0d0e8df3cae473f5f0c4c2cd4f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
