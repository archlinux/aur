# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nempi
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Inferring unobserved perturbations from gene expression data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-e1071
  r-epinem
  r-matrixstats
  r-mnem
  r-naturalsort
  r-randomforest
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6c67b32b3d34a69bc0da33fd0294c58ab889afdc16f3071bd803ca7284001146')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
