# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=reader
_pkgver=1.0.6
pkgname=r-${_pkgname,,}
pkgver=1.0.6
pkgrel=4
pkgdesc='Suite of Functions to Flexibly Read Data from Files'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ncmisc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('905c7c5a1b035ac8213fc533fa26e511abfeea40bd22e3edfde42a49074e88f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
