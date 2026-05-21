# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splineTimeR
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='Time-course differential gene expression data analysis using spline regression models followed by gene association network reconstruction'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-fis
  r-genenet
  r-gseabase
  r-gtools
  r-igraph
  r-limma
  r-longitudinal
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f6ba1cdd8ea64c7ac77f275c02237b7f0c6524a853aa1284c1756f2c9544f921')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
