# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geva
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
sha256sums=('3decf94caecc69975d1471f33b069b13785f2162a0c7b44f7986ba1a71437cf1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
