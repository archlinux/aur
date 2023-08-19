# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RPMG
_pkgver=2.2-7
pkgname=r-${_pkgname,,}
pkgver=2.2.7
pkgrel=1
pkgdesc='Graphical User Interface (GUI) for Interactive R Analysis Sessions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c413de3c126bc377fe31a948887d27f404a9637c57fe0e07b087d5509cb99f11')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
