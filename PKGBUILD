# Maintainer: sukanka <su975853527@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=rcompanion
_pkgver=2.5.1
pkgname=r-${_pkgname,,}
pkgver=2.5.1
pkgrel=1
pkgdesc='Functions to Support Extension Education Program Evaluation'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-coin
  r-desctools
  r-lmtest
  r-multcompview
  r-nortest
  r-plyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('10a0fcf2929de7475f478119215101b66451fad0e779db3b0dd95e2023fcaacc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
