# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CMplot
_pkgver=4.4.3
pkgname=r-${_pkgname,,}
pkgver=4.4.3
pkgrel=1
pkgdesc='Circle Manhattan Plot'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c6ccac4e6bd2f6f6bafed0f72095401b93987877cc3d89ee673f827679bd7256')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
