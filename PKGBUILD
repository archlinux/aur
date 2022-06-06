# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RPMG
_pkgver=2.2-3
pkgname=r-${_pkgname,,}
pkgver=2.2.3
pkgrel=4
pkgdesc='Graphical User Interface (GUI) for Interactive R Analysis Sessions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('74d5bada6a51d280296cb36fae4938c16ba9ed2fa37f3bfb60cf7c541c5b22b6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
