# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sendmailR
_pkgver=1.2-1.1
pkgname=r-${_pkgname,,}
pkgver=1.2.1.1
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
sha256sums=('20d7d54f247dd1b444d2d74170646977cc4bd52f5a4152c72a9c3665b9a1fdb5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
