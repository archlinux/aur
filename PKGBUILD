# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sendmailR
_pkgver=1.3-2
pkgname=r-${_pkgname,,}
pkgver=1.3.2
pkgrel=1
pkgdesc='send email using R'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-base64enc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cab5e72e9349c470e7eadd632b154df4c9cb26631dff8dccbcb12354e1efdd7b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
