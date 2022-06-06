# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GlobalAncova
_pkgver=4.14.0
pkgname=r-${_pkgname,,}
pkgver=4.14.0
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
sha256sums=('641b24765da7bdbc5fa76c9a3edd19e37274c1e99dc4714e432e3a06e8048507')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
