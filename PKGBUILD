# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lmdme
_pkgver=1.47.0
pkgname=r-${_pkgname,,}
pkgver=1.47.0
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
sha256sums=('8cabc9fc18bf14b139ca75f9c287a76819c22940dfd5a98292d94be3f2c5fb3a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
