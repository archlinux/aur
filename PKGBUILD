# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gaia
_pkgver=2.39.0
pkgname=r-${_pkgname,,}
pkgver=2.39.0
pkgrel=1
pkgdesc='GAIA: An R package for genomic analysis of significant chromosomal aberrations.'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ea92176588f246094ef4ee7f5957ba3390438d0f8dc6a00e3cd136e39be07508')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
