# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=float
_pkgver=0.3-2
pkgname=r-${_pkgname,,}
pkgver=0.3.2
pkgrel=1
pkgdesc='32-Bit Floats'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('233a0dd71f02491ce410c173fd3c3a503b3b49a6a5fe092dde61710db2732a91')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
