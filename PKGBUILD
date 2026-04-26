# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=haplo.stats
_pkgver=1.9.8.7
pkgname=r-${_pkgname,,}
pkgver=1.9.8.7
pkgrel=1
pkgdesc='Statistical Analysis of Haplotypes with Traits and Covariates when Linkage Phase is Ambiguous'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-arsenal
  r-rms
)
optdepends=(
  r-r.rsp
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e187b3a38a3c9e20d94ddd04b180a53b158a7d05f0d59d4c4bd79cd37dd6603e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
