# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OpenStats
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='A Robust and Scalable Software Package for Reproducible Analysis of High-Throughput genotype-phenotype association'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-aiccmodavg
  r-car
  r-hmisc
  r-jsonlite
  r-knitr
  r-rlist
  r-summarytools
)
optdepends=(
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fb01b12df339d2fede39a87952557c1df711d9aa3f35710d36de50f1111babf4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
