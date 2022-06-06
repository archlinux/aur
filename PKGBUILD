# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=reportROC
_pkgver=3.5
pkgname=r-${_pkgname,,}
pkgver=3.5
pkgrel=4
pkgdesc='An Easy Way to Report ROC Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-proc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('16d9d1032cfc4de25b23f686ec3e1379a38760bd81ac516fd013ae427e6f7bb8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
