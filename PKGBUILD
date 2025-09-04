# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kinship2
_pkgver=1.9.6.2
pkgname=r-${_pkgname,,}
pkgver=1.9.6.2
pkgrel=1
pkgdesc='Pedigree Functions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-knitr
  r-quadprog
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('85b628c95b8b077e8ff329e5b84d7bc7ab48063f5f0f3da3300b886ab90aea4e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
