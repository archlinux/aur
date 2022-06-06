# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lmdme
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Linear Model decomposition for Designed Multivariate Experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-limma
  r-pls
  r-stemhypoxia
)
optdepends=(
  r-parallel
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8843378c18e0e7aaf40a1da710c2801c3b530ebb7be25e5bfa12ecb40169a6f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
