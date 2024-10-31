# system requirements: nodejs
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcwlPipelines
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Bioinformatics pipelines based on Rcwl'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocfilecache
  r-git2r
  r-httr
  r-rappdirs
  r-rcwl
  r-s4vectors
  nodejs
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('af02a5b3750162f8d82d61a3ca004d6cbe623fd1f7a702834d14a6cf4cb039d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
