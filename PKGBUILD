# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MBCB
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
pkgrel=1
pkgdesc='MBCB (Model-based Background Correction for Beadarray)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-preprocesscore
  r-tcltk2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d1114ef2d1d24a547bfc42744b1152b4aa2c450a2d15eefd96103dbd237e54e3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
