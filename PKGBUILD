# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bamsignals
_pkgver=1.44.1
pkgname=r-${_pkgname,,}
pkgver=1.44.1
pkgrel=1
pkgdesc='Extract read count signals from bam files'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-genomicranges
  r-iranges
  r-rcpp
  r-rhtslib
  r-zlibbioc
  make
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-rsamtools
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e69033211615fd4f0dbcadec6c18867ecf001f0cf403f1df72036dd872d23b64')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
