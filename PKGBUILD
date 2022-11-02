# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geva
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Gene Expression Variation Analysis (GEVA)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-dbscan
  r-fastcluster
  r-matrixstats
)
optdepends=(
  r-devtools
  r-knitr
  r-limma
  r-rmarkdown
  r-roxygen2
  r-testthat
  r-topgo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('08c2048766d86d6d3c012ebf97e51636fb9834ec8c711d360c59061a5f797303')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
