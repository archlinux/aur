# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=QuartPAC
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
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
sha256sums=('d0532016424683f5c28fc817674f2345e0fed0a44b65924c25cf4e93d0b4d6f5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
