# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DEWSeq
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Differential Expressed Windows Based on Negative Binomial Distribution'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-data.table
  r-deseq2
  r-genomeinfodb
  r-genomicranges
  r-r.utils
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-ihw
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7cb7bde9b9177cb443c16c17d51bbc2edacfb31a2125aee909bd825036025ce7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
