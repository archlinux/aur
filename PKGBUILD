# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TEQC
_pkgver=4.18.0
pkgname=r-${_pkgname,,}
pkgver=4.18.0
pkgrel=1
pkgdesc='Quality control for target capture experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-hwriter
  r-iranges
  r-rsamtools
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('db3a6d872f519fdb9e90c8027f6211a70caf8245db9309512fc3906f107411d8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
