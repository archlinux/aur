# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fds
_pkgver=1.8
pkgname=r-${_pkgname,,}
pkgver=1.8
pkgrel=3
pkgdesc='Functional Data Sets'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rainbow
  r-rcurl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('203a5e7671e542dcb83d4c75d0f4012aaebc32d54f94657afaf9e71e99dd0489')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
