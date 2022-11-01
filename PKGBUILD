# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=memuse
_pkgver=4.2-2
pkgname=r-${_pkgname,,}
pkgver=4.2.2
pkgrel=1
pkgdesc='Memory Estimation Utilities'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('63dc2b2ad41da9af5d9b71c1fa9b03f37d1d58db2ed63355c303349d2247b7e5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
