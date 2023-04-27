# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocVersion
_pkgver=3.17.1
pkgname=r-${_pkgname,,}
pkgver=3.17.1
pkgrel=1
pkgdesc='Set the appropriate version of Bioconductor packages'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('63dc47732b400d02cbf9f2271f03a9a28d623e32b6661469ba4f09b36c534958')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
