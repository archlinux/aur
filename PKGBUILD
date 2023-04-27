# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=QuartPAC
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Identification of mutational clusters in protein quaternary structures.'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-graphpac
  r-ipac
  r-spacepac
)
optdepends=(
  r-biocgenerics
  r-rgl
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a0037c47c2e15f0a3e382e5fc6942ce2b2102e166baf63852b58f304e59376ae')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
