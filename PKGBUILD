# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kinship2
_pkgver=1.8.5
pkgname=r-${_pkgname,,}
pkgver=1.8.5
pkgrel=4
pkgdesc='Pedigree Functions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-quadprog
)
optdepends=(
  r-knitr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('72c226b6ccad9efcc70c86050a980fef2e8bb8040bbfe02cb105075a005a16d6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
