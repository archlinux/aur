# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GlobalAncova
_pkgver=4.18.0
pkgname=r-${_pkgname,,}
pkgver=4.18.0
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
sha256sums=('5905bd14c98240a356dac7b8565c1d38060ec8212a9192ada8389b58330a8dba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
