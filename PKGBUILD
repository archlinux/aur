# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gcrma
_pkgver=2.76.0
pkgname=r-${_pkgname,,}
pkgver=2.76.0
pkgrel=1
pkgdesc='Background Adjustment Using Sequence Information'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-affy
  r-affyio
  r-biobase
  r-biocmanager
  r-biostrings
  r-xvector
)
optdepends=(
  r-affydata
  r-hgu95av2cdf
  r-hgu95av2probe
  r-splines
  r-tools
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e35a659cbd927fd21341888e9ca04f0eeed4bd0f8272254a1104fa1436596905')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
