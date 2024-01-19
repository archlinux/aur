# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fmsb
_pkgver=0.7.6
pkgname=r-${_pkgname,,}
pkgver=0.7.6
pkgrel=1
pkgdesc='Functions for Medical Statistics Book with some Demographic Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-epi
  r-vcd
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e57df29d44d988ec977b3d7a6250e5d647ae8572bc41240bb86290252d79d3b2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
