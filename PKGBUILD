# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RRHO
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
pkgrel=1
pkgdesc='Inference on agreement between ordered lists'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-venndiagram
)
optdepends=(
  r-lattice
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8afd34d3bc1c0e6dae2b26961c32a94b0c85fa6247be832b463cb1345d52bedd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
