# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Herper
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=1.3.0
pkgrel=3
pkgdesc='The Herper package is a simple toolset to install and manage conda packages and environments from R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-reticulate
  r-rjson
  r-withr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-seqcna
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.zip")
sha256sums=('79a7aeb091795e58b0fec8780306f5e7e5df9045c8d95bd3aefb9dbfec560c0d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
