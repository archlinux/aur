# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Quartet
_pkgver=1.2.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Comparison of Phylogenetic Trees Using Quartet and Split Measures'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-rcpp
  r-rdpack
  r-ternary
  r-treetools
  r-viridislite
)
optdepends=(
  r-bookdown
  r-knitr
  r-phangorn
  r-rcpp
  r-rmarkdown
  r-testthat
  r-usethis
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
