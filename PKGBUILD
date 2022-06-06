# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rslurm
_pkgver=0.6.1
pkgname=r-${_pkgname,,}
pkgver=0.6.1
pkgrel=4
pkgdesc="Submit R Calculations to a 'Slurm' Cluster"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-whisker
)
optdepends=(
  r-knitr
  r-markdown
  r-parallel
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8ef52e87a22297e2476ce129b065445814d7320cf9fe5bd792561fe8580c85a4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
