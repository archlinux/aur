# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MantelCorr
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=1.70.0
pkgrel=1
pkgdesc='Compute Mantel Cluster Correlations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cdfb9c4e4b990a062def29f57ab286490508f2455c1ce0ba09b91d125a2d7e03')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
