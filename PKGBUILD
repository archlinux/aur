# system requirements: gtkmm-2.4, GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HilbertVisGUI
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=1.58.0
pkgrel=1
pkgdesc='HilbertVisGUI'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-hilbertvis
  gtkmm
)
optdepends=(
  r-iranges
  r-lattice
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4ef44e8be389846eef8f9332dc66392d017eef2edd9c78399e8d76ed6f98db98')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
