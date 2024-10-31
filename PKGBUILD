# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OLIN
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=1.84.0
pkgrel=1
pkgdesc='Optimized local intensity-dependent normalisation of two-color microarrays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-limma
  r-locfit
  r-marray
)
optdepends=(
  r-convert
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b254c927352b360fff6bd4395e0872d663d90909ba10cd7b2246cff6dbdcb7ee')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
