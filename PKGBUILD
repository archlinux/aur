# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nnNorm
_pkgver=2.78.0
pkgname=r-${_pkgname,,}
pkgver=2.78.0
pkgrel=1
pkgdesc='Spatial and intensity based normalization of cDNA microarray data based on robust neural nets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-marray
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('84e57cb8ec80a2e9097d08ea161a8b94138d47410ba9d80727f5448044629027')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
