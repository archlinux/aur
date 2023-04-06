# system requirements: zlib headers and library.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqinr
_pkgver=4.2-30
pkgname=r-${_pkgname,,}
pkgver=4.2.30
pkgrel=1
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
sha256sums=('faf8fe533867eeef57fddfa6592e19d5984954d0670c6c7dbeab6411d55fee4b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
