# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SIM
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=1.76.0
pkgrel=1
pkgdesc='Integrated Analysis on two human genomic datasets'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-globaltest
  r-quantreg
  r-quantsmooth
)
optdepends=(
  r-biomart
  r-rcolorbrewer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b463878d62b06552455afef4a72790cdbf0e1f10be8345d8b32b4ec33012b71f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
