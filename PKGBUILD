# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SPARQL
_pkgver=1.16
pkgname=r-${_pkgname,,}
pkgver=1.16
pkgrel=4
pkgdesc='SPARQL client'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcurl
  r-xml
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2cb366b2b93804c12f17254a1c37687887fc12047b58b13aab0d7a6f000e533d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
