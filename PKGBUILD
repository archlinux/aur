# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive.data.uk
_pkgver=0.0-2
pkgname=r-${_pkgname,,}
pkgver=0.0.2
pkgrel=8
pkgdesc='Assertions to Check Properties of Strings'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertive.base
  r-assertive.strings
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ab48dab6977e8f43d6fffb33228d158865f68dde7026d123c693d77339dcf2bb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
