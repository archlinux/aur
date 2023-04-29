# system requirements: On a Unix-alike, one of the C functionsmach_absolute_time (macOS), clock_gettime or gethrtime. If noneof these is found, the obsolescent POSIX function gettimeofdaywill be tried.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=microbenchmark
_pkgver=1.4.10
pkgname=r-${_pkgname,,}
pkgver=1.4.10
pkgrel=1
pkgdesc='Accurate Timing Functions'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
  gcc
)
optdepends=(
  r-ggplot2
  r-multcomp
  r-runit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('04cc41be72708dce8d31ff1cb105d88cc9f167250ea00fe9a165c99204b9b481')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
