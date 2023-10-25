# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocVersion
_pkgver=3.18.0
pkgname=r-${_pkgname,,}
pkgver=3.18.0
pkgrel=1
pkgdesc='Set the appropriate version of Bioconductor packages'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8301ff8a8b35304a5446b710cec56720d93dee6fd9bf8e4213712ef65270ec1f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
