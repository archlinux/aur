# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GlobalAncova
_pkgver=4.22.0
pkgname=r-${_pkgname,,}
pkgver=4.22.0
pkgrel=1
pkgdesc='Global test for groups of variables via model comparisons'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotate
  r-annotationdbi
  r-biobase
  r-corpcor
  r-dendextend
  r-globaltest
  r-gseabase
  r-vgam
)
optdepends=(
  r-go.db
  r-golubesets
  r-hu6800.db
  r-rgraphviz
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('10af604e16b124e4be81f568fc4885face40bbdb4a11d42198801c4f6051e17c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
