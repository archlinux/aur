# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splineTimeR
_pkgver=1.31.0
pkgname=r-${_pkgname,,}
pkgver=1.31.0
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
sha256sums=('6009dee2b66d13fe43127f82b3e92619f1ded3e3daf8d69c159f0269041026da')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
