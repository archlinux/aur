# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GFA
_pkgver=1.0.3
pkgname=r-${_pkgname,,}
pkgver=1.0.3
pkgrel=4
pkgdesc='Group Factor Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0357b163e83662d4e8a229a27d377226ce8f84afc20eafc0cd8c47dab1de5183')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
