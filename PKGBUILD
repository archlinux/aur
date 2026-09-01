# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lexicon
_pkgver=1.3.2
pkgname=r-${_pkgname,,}
pkgver=1.3.2
pkgrel=1
pkgdesc='Lexicons for Text Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-syuzhet
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fdddbb6a6343ca5d6b57838069f96f38a8b943e277c140e5077796cd662855a1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
