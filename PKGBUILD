# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fds
_pkgver=1.9
pkgname=r-${_pkgname,,}
pkgver=1.9
pkgrel=1
pkgdesc='Functional Data Sets'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rainbow
  r-rcurl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1d86f83aa105abd3073e5cdac84da935e12183def93df6c5ed7b871d51df3b0e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
