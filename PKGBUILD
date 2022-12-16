# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nuCpos
_pkgver=1.16.2
pkgname=r-${_pkgname,,}
pkgver=1.16.2
pkgrel=1
pkgdesc='An R package for prediction of nucleosome positions'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
)
optdepends=(
  r-biostrings
  r-nupop
  r-testthat
)
makedepends=(
  gcc-fortran
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('09e865b6d3bb00183f329db5742b9a842ba18a9d16ef77634983e031e7be6daa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
