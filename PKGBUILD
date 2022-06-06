# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NMI
_pkgver=2.0
pkgname=r-${_pkgname,,}
pkgver=2.0
pkgrel=4
pkgdesc='Normalized Mutual Information of Community Structure in Network'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c39fd733944601dd314dc37a4b0332d374236aa2bb21f263833f79989387b7e7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
