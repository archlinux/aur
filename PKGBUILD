# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genomes
_pkgver=3.32.0
pkgname=r-${_pkgname,,}
pkgver=3.32.0
pkgrel=1
pkgdesc='Genome sequencing project metadata'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-curl
  r-readr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('054df747ef956fdbb6acbb20417216c5114f4a0960d274e88c34fc73fb60cf0f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
