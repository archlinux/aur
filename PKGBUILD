# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DiffLogo
_pkgver=2.30.0
pkgname=r-${_pkgname,,}
pkgver=2.30.0
pkgrel=1
pkgdesc='DiffLogo: A comparative visualisation of biooligomer motifs'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-cba
)
optdepends=(
  r-knitr
  r-motifdb
  r-seqlogo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a18841be8ee7d0a05d9a5b20499ebd0e0fe80c127fe90d4c8edb16da7a181a63')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
