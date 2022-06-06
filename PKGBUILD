# system requirements: zlib headers and library.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqinr
_pkgver=4.2-16
pkgname=r-${_pkgname,,}
pkgver=4.2.16
pkgrel=3
pkgdesc='Biological Sequences Retrieval and Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ade4
  r-segmented
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c4f3253832fc255197bdce7b4dd381db606c6b787d2e888751b4963acf3a4032')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
