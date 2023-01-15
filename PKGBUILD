# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sparsesvd
_pkgver=0.2-2
pkgname=r-${_pkgname,,}
pkgver=0.2.2
pkgrel=1
pkgdesc="Sparse Truncated Singular Value Decomposition (from 'SVDLIBC')"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bb40cc69ee3aec28ff1418fd16cd76d953701a7b0d6bdcb0424c71793d96d836')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
