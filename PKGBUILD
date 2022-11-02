# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chromstaRData
_pkgver=1.23.0
pkgname=r-${_pkgname,,}
pkgver=1.23.0
pkgrel=1
pkgdesc='ChIP-seq data for Demonstration Purposes'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('75b2622af2cc24d22c1f1b2ff314e03bdbf26c0d8ef5d69cc367aec659b0dc67')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
