# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pcaPP
_pkgver=2.0-3
pkgname=r-${_pkgname,,}
pkgver=2.0.3
pkgrel=1
pkgdesc='Robust PCA by Projection Pursuit'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-mvtnorm
)
optdepends=(
  r-robustbase
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1aac554f039753bf9d026090e47d66b82bf3f1f75479ed0adefa3f7bbb55d603')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
