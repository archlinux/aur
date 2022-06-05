# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aod
_pkgver=1.3.2
pkgname=r-${_pkgname,,}
pkgver=1.3.2
pkgrel=3
pkgdesc='Analysis of Overdispersed Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-boot
  r-lme4
  r-mass
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9b85be7b12b31ac076f2456853a5b18d8a79ce2b86d00055264529a0cd28515c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
