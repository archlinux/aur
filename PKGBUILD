# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=udapi
_pkgver=0.1.3
pkgname=r-${_pkgname,,}
pkgver=0.1.3
pkgrel=5
pkgdesc='Urban Dictionary API Client'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-curl
  r-httr
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c8986a63be002c4fb9b65a94fa91be4054dd53ea803661e1084945049b33d663')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
