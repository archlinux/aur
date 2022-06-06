# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=memuse
_pkgver=4.2-1
pkgname=r-${_pkgname,,}
pkgver=4.2.1
pkgrel=4
pkgdesc='Memory Estimation Utilities'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f5e9dbaad4efbbfe219a93f446e318a00cad5b294bfc60ca2146eca894b47cf3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
