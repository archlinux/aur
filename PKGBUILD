# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=haplo.stats
_pkgver=1.9.2
pkgname=r-${_pkgname,,}
pkgver=1.9.2
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
sha256sums=('a6c006e31db0c9003e3b136fb9371fdc5528c383f709379cf2497c8c59cf278d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
